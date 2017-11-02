require 'date'

class Account
  STANDARD_VALIDITY_YRS = 5
  attr_reader :exp_date, :pin_code, :account_status, :owner
  attr_accessor :balance

  def initialize(attrs = {})
    @pin_code = set_pin_code
    @balance = 0
    @exp_date = set_expire_date
    @account_status = :active
    set_owner(attrs[:owner])
  end

  def set_expire_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
  end

  def set_pin_code
    rand(1000..9999)
  end

  def deactivate
    @account_status = :deactivated
  end

  private

  def set_owner(obj)
    obj == nil ? missing_owner : @owner = obj
  end

  def missing_owner
    raise "An Account owner is required"
  end
end
account = Account.new(owner: 'Scott')
puts account.owner
