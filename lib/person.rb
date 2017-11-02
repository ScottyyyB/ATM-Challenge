# require 'account'

class Person
  attr_reader :cash, :name
  attr_accessor :account

  def initialize(attrs = {})
    @cash = 0
    @account = nil
    set_name(attrs[:name])
  end

  def create_account
    @account = Account.new(owner: @name)
  end

  def deposit(amount)
    @account == nil ? missing_account : @account.balance += amount
  end

  private

  def missing_account
    raise 'No account present'
  end

  def set_name(obj)
    obj == nil ? missing_name : @name = obj
  end

  def missing_name
    raise 'A name is required'
  end
end
me = Person.new(name: 'Scott')
puts me.name
