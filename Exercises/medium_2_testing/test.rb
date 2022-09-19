require 'stringio'
require_relative 'transaction'

transaction = Transaction.new(50)
transaction.amount_paid = 10
input = StringIO.new("30\n")
transaction.prompt_for_payment(input: input)


# input = StringIO.new("Hello world\n")
# puts input
# message = input.gets.chomp
# puts message