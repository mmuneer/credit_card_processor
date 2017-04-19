require 'spec_helper'
require_relative '../../../lib/sorter/default_orderer'
require_relative '../../../lib/account_manager'

RSpec.describe DefaultOrderer do
  it 'sorts data based on attributes' do
    args = ['Tom', '4111111111111111', '$1000']
    args1 = ['Penny', '4111111111111112', '$2000']
    AccountManager.add(args)
    AccountManager.add(args1)

    sorted = DefaultOrderer.new.order(AccountManager.accounts, 'owner')

    expect(sorted.first.owner).to eql('Penny')
    expect(sorted.last.owner).to eql('Tom')
  end
end
