require './lib/account.rb'
require 'Date'

describe Account do
  subject = described_class.new("Scott Bartels")
  it 'is expected to have the given name on initialize' do
    expect(subject.account_owner).to eq "Scott Bartels"
  end

  it 'should be given a 4 digit random pin_code on initialize ranging from 1000 to 9999' do
    expected_pin_code_length = Math.log10(subject.pin_code).to_i + 1
    expect(expected_pin_code_length).to eq 4
    expect(subject.pin_code).to be_between(1000,9999)
  end

  it 'is expected to an expiry date on initialize' do
     expected_date = Date.today.next_year(5).strftime("%m/%y")
    expect(subject.exp_date).to eq expected_date
  end

  it 'is expected to have a balance of 0 by default, if it takes no argument on initialize' do
    expect(subject.balance).to eq 0
  end

  it 'is expected to have a modified balance, if the value is changed' do
    expected_balance = subject.balance = 200
    expect(expected_balance).to eq 200
  end

  it 'is expected to have an account status of active on initialize' do
    expect(subject.account_status).to eq :active
  end



end
