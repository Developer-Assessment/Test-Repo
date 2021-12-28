class Player
	attr_accessor :credits, :active

	class SubCreditError < StandardError

    def message

      "Zero Sub Credits"

    end

  end

	def sub_credits(sub_creds)
		if sub_creds == 0
		  raise SubCreditError
		end	
		@credits = @credits - sub_creds
	end
		
end	