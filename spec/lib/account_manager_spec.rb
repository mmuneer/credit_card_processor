require 'spec_helper'
require_relative '../../lib/account_manager'
require_relative '../../lib/formatter/formatter'

RSpec.describe AccountManager do
	after(:each) do
		AccountManager.accounts.clear
	end	
	describe 'process' do
		it 'invokes appropiate functions based on arguments' do
			line_item = ['Add', 'Tom', '4111111111111111', '$1000']

			expect(AccountManager).to receive(:send).with('add', ['Tom', '4111111111111111', '$1000'])

			AccountManager.process(line_item)
		end
	end

	describe 'add' do
		it 'creates a new account and adds to accounts collection' do
			args = ['Tom', '4111111111111111', '$1000']
			AccountManager.add(args)

			expect(AccountManager.accounts.size).to eql(1)
			expect(AccountManager.accounts.first.owner).to eql('Tom')
		end
	end	

	describe 'charge' do
		it 'invokes account.charge if account is valid' do
			args = ['Tom', '4111111111111111', '$1000']
			AccountManager.add(args)
			account = AccountManager.accounts.first

			expect(account).to receive(:charge).with(1000)

			AccountManager.charge(['Tom', '$1000'])

		end
		
		it 'does not invoke account.charge if account is not valid' do
			args = ['Tom', '4', '$1000']
			AccountManager.add(args)

			account = AccountManager.accounts.first
			expect(account).to_not receive(:charge).with(1000)

			AccountManager.charge(['Tom', '$1000'])
		end	
	end

	describe 'credit' do
		it 'invokes account.credit if account is valid' do
			args = ['Tom', '4111111111111111', '$1000']
			AccountManager.add(args)
			account = AccountManager.accounts.first

			expect(account).to receive(:credit).with(1000)

			AccountManager.credit(['Tom', '$1000'])

		end
		
		it 'does not invoke account.charge if account is not valid' do
			args = ['Tom', '4', '$1000']
			AccountManager.add(args)

			account = AccountManager.accounts.first
			expect(account).to_not receive(:credit).with(1000)

			AccountManager.credit(['Tom', '$1000'])
		end	
	end

	describe 'find' do
		it 'searches for account based on owner name and returns the first match' do
			args = ['Tom', '4', '$1000']
			AccountManager.add(args)

			expect(AccountManager.find('Tom').owner).to eql('Tom')
		end	

		it 'returns nil if account is not found' do
			expect(AccountManager.find('Bobby')).to eql(nil)
		end	
	end

	describe 'accounts' do
		it 'returns the list of accounts' do
			args = ['Tom', '4111111111111111', '$1000']
			AccountManager.add(args)

			expect(AccountManager.accounts.size).to eql(1)
			expect(AccountManager.accounts.first.owner).to eql('Tom')
		end			
	end	

	describe 'display_summary' do
		it 'displays in specified format' do
			args = ['Tom', '4111111111111111', '$1000']
			AccountManager.add(args)
			formatter = Formatter.new(AccountManager.sorted_accounts)
			allow(Formatter).to receive(:new).and_return(formatter)

			expect(Formatter.new(AccountManager.sorted_accounts)).to receive(:print)

			AccountManager.display_summary
		end	

	describe 'sorted_accounts' do
		it 'sorts the account based on owner name' do
			args = ['Tom', '4111111111111111', '$1000']
			args1 = ['Penny', '4111111111111112', '$2000']
			AccountManager.add(args)
			AccountManager.add(args1)
			
			expect(AccountManager.sorted_accounts.first.owner).to eql('Penny')
			expect(AccountManager.sorted_accounts.last.owner).to eql('Tom')
		end	
	end	
end	


end	