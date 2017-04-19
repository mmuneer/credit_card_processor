require 'luhn'

class Validator
  MAX_LIMIT = 19

  def self.luhn10_valid?(number)
    Luhn.valid?(number)
  end

  def self.length_valid?(number)
    digits = number.to_s.split('').map(&:to_i)
    digits.length < MAX_LIMIT
  end

  def self.valid?(number)
    length_valid?(number) && luhn10_valid?(number)
  end
end
