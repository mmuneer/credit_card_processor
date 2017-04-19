require 'spec_helper'
require_relative '../../lib/account'

RSpec.describe Account do
	before(:each) do
		@account = Account.new({owner: 'Tom', number: 1, limit: 1000})
	end	
	describe 'initialize' do
		it 'sets owner name' do
			expect(@account.owner).to eql('Tom')
		end

		it 'sets credit card number' do
			expect(@account.number).to eql(1)
		end

		it 'sets credit limit' do
			expect(@account.limit).to eql(1000)
		end

		it 'sets balance to 0' do
			expect(@account.balance).to eql(0)
		end	

		it 'sets status to INVALID if account is not valid' do
			expect(@account.status).to eql(Account::STATUS[:INVALID])
	    end

	end	

	describe 'charge' do
		it 'increases balance to the specified amount' do
			@account.charge(500)
			expect(@account.balance).to eql(500)
		end
		
		it 'does not increase balance if the specified amount goes over limit' do
			@account.charge(2500)
			expect(@account.balance).to eql(0)
		end	
	end	

	describe 'credit' do
		it 'decreases balance to the specified amount' do
			@account.credit(500)
			expect(@account.balance).to eql(-500)
		end
	end	

	describe 'valid?' do
		it 'returns false if status is INVALID' do
			expect(@account.valid?).to be false
		end	

		it 'returns true if status is VALID' do
			valid_account = Account.new({owner: 'Tom', number: 4111111111111111, limit: 1000})
			expect(valid_account.valid?).to be true
		end	
	end	
end