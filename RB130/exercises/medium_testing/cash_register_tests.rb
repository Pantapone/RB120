# cash_register_tests.rb

require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

require "minitest/reporters"
Minitest::Reporters.use!
require "simplecov"
SimpleCov.start


class CashRegisterTest < Minitest::Test

  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(5)
    transaction.amount_paid = 5
    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money
    assert_equal(previous_amount + 5, current_amount)
  end

  def test_change
    register = CashRegister.new(100)
    transaction = Transaction.new(5)
    transaction.amount_paid = 40
    price = transaction.item_cost
    payment = transaction.amount_paid
    change = payment - price
    assert_equal(change, register.change(transaction))
  end

  def test_give_receipt
    item_cost = 40
    register = CashRegister.new(100)
    transaction = Transaction.new(item_cost)
    
    assert_output("You've paid $#{item_cost}.\n") do
     register.give_receipt(transaction)
    end
  end

end

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30\n')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 30, transaction.amount_paid
  end
end

