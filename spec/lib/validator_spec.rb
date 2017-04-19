require 'spec_helper'
require_relative '../../lib/validator'

RSpec.describe Validator do
  it 'returns true if credit card number is luhn10_valid' do
    expect(Validator.luhn10_valid?(1_234_567_890_123_456)).to be false
  end

  it 'returns true credit card number is up to 19 digits' do
    expect(Validator.length_valid?(4_111_111_111_111_111)).to be true
  end

  it 'returns false credit card number exceeds 19 digits' do
    expect(Validator.length_valid?(41_111_111_111_111_111_111)).to be false
  end
end
