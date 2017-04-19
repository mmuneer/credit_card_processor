require 'spec_helper'
require_relative '../../lib/validator'

RSpec.describe Validator do
	it 'returns true if credit card number is luhn10_valid' do
		expect(Validator.luhn10_valid?(1234567890123456)).to be false
	end
	
	it 'returns true credit card number is up to 19 digits' do
		expect(Validator.length_valid?(4111111111111111)).to be true
	end	

	it 'returns false credit card number exceeds 19 digits' do
		expect(Validator.length_valid?(41111111111111111111)).to be false
	end
end	