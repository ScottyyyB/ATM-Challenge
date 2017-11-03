# ATM-Challenge

## Brief Description
This is my submission for the ATM Challenge. I have three classes interact with one another, the following three: Person, Account and ATM.
This program is an ATM simulator using the magic of ruby. Follow the instructions to get correct usage of this fun program!

## Attention
Be aware that some of the 'Should get:' messages written below may not exactly match the messages you will receive.

## Getting Started
1. In terminal type `irb`
2. Load the files
* Type: `load './lib/person.rb'`
* Should get `=> true`
* Type: `load './lib/atm.rb'`
* Should get `=> true`

## Become a Person
1. Make a new instance/copy of the Person class
* Type: `me = Person.new(name: 'Scott')`
* Should get: `=> #<Person:0x007fb43a8496a8 @cash=0, @account=nil, @name="Scott"> `

2. Make it rain - Create a bank account
* Type: `account = me.create_account`
* Should get: `=> #<Account:0x007fb43b075980 @pin_code=5462, @balance=0, @exp_date="11/22", @account_status=:active, @owner="Scott">`

## Deposit Into Account
1. Increase your cash value
* Type: `me.cash = 100`
* Should get: `=> 100`

2. Deposit desired amount into account
* Type: `me.deposit(100)`
* Should get: `=> 100`

## Withdraw From Account
1. Check your pin code
* Type: `me.account.pin_code`
* Should get: `=> 5462`

2. Withdraw desired amount from account balance
* Type: `me.withdraw(amount: 100, pin: 5462, atm: Atm.new)`
* Should get: `=> {:status=>true, :message=>"success", :date=>#<Date: 2017-11-03 ((2458061j,0s,0n),+0s,2299161j)>, :amount=>100, :bills=>[50, 50]}`

3. Check the value of your cash
* Type: `me.cash`
* Should get: `=> 100`
