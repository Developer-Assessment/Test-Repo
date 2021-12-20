require 'rails_helper'

RSpec.describe Booking, type: :model do

  
  describe "Validations" do
    it { should validate_presence_of(:name).with_message("Name should not be empty") }
    it { should validate_presence_of(:email).with_message("Email Should not be empty") }
    it { should validate_presence_of(:mobile).with_message("Mobile Should not be empty") }

  end

  context 'scope tests' do
    booking = FactoryBot.create(:booking)

    it 'should return booked meeting rooms count' do
      expect(Booking.booked.size).to eq(3)
    end

    it 'should return available meeting rooms count' do
      expect(Booking.unbooked.size).to eq(0)
    end  
  end 

end
