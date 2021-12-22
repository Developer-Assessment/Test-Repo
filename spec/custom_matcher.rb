module CustomMatcher
  class OurCustomMatcher
  	def matches?(value)
  		true
  	end	
  end
  
  def self.custom_matcher
  OurCustomMatcher.new
  end	

end	