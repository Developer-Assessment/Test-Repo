require 'book'

describe 'book' do
	it 'Tells you about Ruby On Rails' do
		b = Book.new
		textbook = b.book('Ruby')
		expect(textbook).to be_truthy
	end	
end

