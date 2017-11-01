require 'date'

class Account
  STANDARD_VALIDITY_YRS = 5
  attr_reader :exp_date, :pin_code, :account_owner, :account_status
  attr_accessor :balance

  def initialize(account_owner)
    @pin_code = set_pin_code
    @balance = 0
    @exp_date = set_expire_date
    @account_status = :active
    @account_owner = account_owner
  end

  def set_expire_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
  end

  def set_pin_code
    rand(1000..9999)
  end
end
