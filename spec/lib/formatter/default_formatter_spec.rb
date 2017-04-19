require 'spec_helper'
require_relative '../../../lib/formatter/default_formatter'
require_relative '../../../lib/account'

RSpec.describe DefaultFormatter do
  describe 'print_valid' do
    it 'prints in specified format for valid data' do
      output = 'Tom: $0'
      valid_account = Account.new(owner: 'Tom', number: 4_111_111_111_111_111, limit: 1000)

      expect(STDOUT).to receive(:puts).with(output)

      DefaultFormatter.new.print_valid(valid_account)
    end
  end

  describe 'print_invalid' do
    it 'prints in specified format for invalid data' do
      output = 'Penny: error'
      invalid_account = Account.new(owner: 'Penny', number: 4, limit: 1000)

      expect(STDOUT).to receive(:puts).with(output)

      DefaultFormatter.new.print_invalid(invalid_account)
    end
  end
end
