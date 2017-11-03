require_relative 'account.rb'

class Atm
  attr_accessor :funds

  def initialize
    @funds = 1000
  end

  def withdraw(amount, pin_code, account)
    case
    when insufficient_funds_in_account?(amount, account)
      { status: false, message: 'insufficient funds', date: Date.today }

    when insufficient_funds_in_atm?(amount)
      { status: false, message: 'insufficient funds in ATM', date: Date.today }

    when insufficient_pin?(pin_code, account.pin_code)
      { status: false, message: 'wrong pin', date: Date.today }

    when card_expired?(account.exp_date)
      { status: false, message: 'card expired', date: Date.today }

    when account_disabled?(account.account_status)
      { status: false, message: 'account disabled', date: Date.today }

    when add_bills_error?(amount)
      { status: false, message: 'invalid amount', date: Date.today }
    else
      perform_transaction(amount, account)
    end
  end

  private

  def card_expired?(exp_date)
    Date.strptime(exp_date, '%m/%y') < Date.today
  end

  def insufficient_pin?(pin_code, actual_pin)
    pin_code != actual_pin
  end

  def insufficient_funds_in_account?(amount, account)
    amount > account.balance
  end

  def insufficient_funds_in_atm?(amount)
    @funds < amount
  end

  def perform_transaction(amount, account)
    @funds -= amount
    account.balance -= amount
    { status: true, message: 'success', date: Date.today, amount: amount, bills: add_bills(amount) }
  end

  def add_bills(amount)
    demoninations = [20, 10, 5]
    bills = []
    demoninations.unshift(50) if amount >= 50

    demoninations.each do |bill|
      while amount - bill >= 0
        amount -= bill
        bills << bill
      end
    end
   return bills
end

  def add_bills_error?(amount)
    amount % 5 != 0
  end

  def account_disabled?(status)
    status == :deactivated
  end
end

# puts Atm.new.funds -= 900
