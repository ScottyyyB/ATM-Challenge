require './lib/account'

class Person
  attr_reader :name
  attr_accessor :account, :cash

  def initialize(attrs = {})
    @cash = 0
    @account = nil
    set_name(attrs[:name])
  end

  def create_account
    @account = Account.new(owner: @name)
  end

  def deposit(amount)
    error_message('Account') if @account.nil?
    deposit_funds(amount)
  end

  def withdraw(args = {})
    error_message('ATM') if args[:atm].nil?
    withdraw_funds(args)
  end

  private

  def withdraw_funds(args)
    atm = args[:atm]
    withdraw = atm.withdraw(args[:amount], args[:pin], @account)
    increase_funds(args) if withdraw[:status]
    withdraw
  end

  def increase_funds(cash)
    @cash += cash[:amount]
  end

  def deposit_funds(amount)
    @cash -= amount
    @account.balance += amount
  end

  def error_message(item)
    raise "#{item} is required"
  end

  def set_name(name)
    # name.nil? ? error_message('Name') : @name = name
    error_message('Name') if name.nil?
    @name = name
  end

end
# me = Person.new(name: 'Scott')
# puts me.name
