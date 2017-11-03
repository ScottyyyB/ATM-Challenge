require 'date'

class Account
  STANDARD_VALIDITY_YRS = 5
  attr_reader :exp_date, :pin_code
  attr_accessor :balance, :account_status, :owner

  def initialize(attrs = {})
    @pin_code = generate_pin
    @balance = attrs[:balance] || 0
    @exp_date = set_expire_date
    @account_status = :active
    set_owner(attrs[:owner])
  end

  def deactivate
    @account_status = :deactivated
  end

  private

  def set_expire_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
  end

  def generate_pin
    rand(1000..9999)
  end

  def set_owner(name)
    missing_owner if name.nil?
    @owner = name
  end

  def missing_owner
    raise "An Account owner is required"
  end
end
# account = Account.new(owner: 'Scott')
# puts account.owner
