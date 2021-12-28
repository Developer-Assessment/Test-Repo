require 'rook'

describe "Rook" do
	it 'returns the correct points value' do
		rook = Rook.new
		rook_points = rook.points
		expect(rook_points).to be(5)
    end

    # Tells us about .eq matchers
	it 'returns the correct name' do
		rook = Rook.new
		rook_name = rook.name
		# expect(rook_name).to be("Rook") #"Rook".object_id is mutable hence can't use 'be' instead using 'eq'
		expect(rook_name).to eq("Rook")
    end

    # Tells us about comparision matchers
    it 'returns a point value greater than a pawns' do
        rook = Rook.new
        rook_points = rook.points
        expect(rook_points).to be > 1
        # expect(rook_points).to be_between(1, 10).exclusive # It will fails for an input value of 1
        # expect(rook_points).to be_between(1, 10) # Range comparision
        # expect(rook_points).to be_between(1, 10).inclusive # It includes the value of 1
    end
end	