require './lib/account.rb'
require 'Date'

describe Account do

  let(:person) {instance_double('Person', name: 'Thomas')}
  subject { described_class.new(owner: person) }

  it 'is expected to have an owner' do
    expect(subject.owner).to eq person
  end

  it 'is expected to raise error if no owner is set' do
    expect { described_class.new }.to raise_error 'An Account owner is required'
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

  it 'deactivates account using Instance method' do
    subject.deactivate
    expect(subject.account_status).to eq :deactivated
  end
end
