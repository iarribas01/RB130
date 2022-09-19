
require 'minitest/autorun'
# require 'minitest/reporters'
require_relative 'transaction'
# Minitest::Reporters.use!
require 'stringio'

class TransactionTest < Minitest::Test

  def test_prompt_for_payment
    transaction = Transaction.new(50)
    input = StringIO.new("50\n")
    transaction.prompt_for_payment(input: input)
    assert_equal 50, transaction.amount_paid
  end

end
