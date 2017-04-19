REQUIRE_RELATIVE '../lib/validator'

class Account
	attr_reader :owner, :number, :status, :limit
	attr_accessor :balance

	VALID_STATUS = 'valid'
	INVALID_STATUS = 'invalid'

	def initialize(args)
		@owner = args[:owner]
		@number = args[:number]
		@limit = args[:limit]
		@balance = 0
		@status = Validator.valid?(number) ? VALID_STATUS : INVALID_STATUS
	end

	def charge(amount)
		if balance + amount > limit
			 #ignore as if they were declined
		else
			 self.balance += amount
		end
	end

    def credit(amount)
    	self.balance -= amount
    end

    def valid?
    	@status == VALID_STATUS ? true : false
    end	
end