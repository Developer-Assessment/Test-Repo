require_relative '../lib/board'
require_relative 'custom_matcher'

RSpec.describe Board do
    describe "#total_pieces" do
    	it 'has a total of 32 pieces' do
    		b = Board.new
            expect(b.total_pieces).to eq(32) # Without using Custom Matcher
    		expect(b.total_pieces).to CustomMatcher.custom_matcher(32) # Using Custom Matcher
    	end	
    end	
end	