require_relative 'account.rb'

class Atm
  attr_accessor :funds

  def initialize
    @funds = 1000
  end

  def withdraw(amount, pin_code, account)
    case
    when insufficient_funds_in_account?(amount, account.balance)
      error_message('insufficient funds')
    when insufficient_funds_in_atm?(amount)
      error_message('insufficient funds in ATM')
    when insufficient_pin?(pin_code, account.pin_code)
      error_message('wrong pin')
    when card_expired?(account.exp_date)
      error_message('card expired')
    when account_disabled?(account.account_status)
      error_message('account disabled')
    when add_bills_error?(amount)
      error_message('invalid amount')
    else
      perform_transaction(amount, account)
    end
  end

  private

  def error_message(reason)
    { status: false, message: reason, date: Date.today }
  end

  def card_expired?(exp_date)
    Date.strptime(exp_date, '%m/%y') < Date.today
  end

  def insufficient_pin?(pin, actual_pin)
    pin != actual_pin
  end

  def insufficient_funds_in_account?(amount, account)
    amount > account
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
