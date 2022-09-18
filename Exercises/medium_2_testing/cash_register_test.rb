require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'cash_register'
require_relative 'transaction'

Minitest::Reporters.use!

class CashRegisterTest < Minitest::Test

  # def test_accept_money
  #   reg = CashRegister.new(500)
  #   transaction = Transaction.new(10)
  #   transaction.amount_paid = 10
  #   previous_amount = reg.total_money
  #   reg.accept_money(transaction)
    
  #   assert_equal(previous_amount + 10, reg.total_money)
  # end

  def test_change
    reg = CashRegister.new(500)
    transaction = Transaction.new(10)
    transaction.amount_paid = 10

    change = reg.change(transaction)
    assert_equal(0, change)
  end

  def test_give_receipt
    reg = CashRegister.new(500)
    transaction = Transaction.new(10)
    transaction.amount_paid = 10

    assert_output("You've paid $10.\n") do 
      reg.give_receipt(transaction)
    end
  end
end