require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'transaction'
Minitest::Reporters.use!

class TransactionTest < Minitest::Test 
  def test_prompt_for_payment
    transaction = Transaction.new(50)
    transaction.amount_paid = 10

    input = StringIO.new("30\n").gets.chomp
    expected_output = <<-HEREDOC
    You owe $50.
    How much are you paying?
    30
    That is not the correct amount. Please make sure to pay the full cost.
    HEREDOC

    assert_output(expected_output) do 
      transaction.prompt_for_payment(input: input)
    end
  end

end
