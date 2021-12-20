require 'rails_helper'

RSpec.describe Booking, type: :model do

  
  describe "Validations" do
    it { should validate_presence_of(:name).with_message("Name should not be empty") }
    it { should validate_presence_of(:email).with_message("Email Should not be empty") }
    it { should validate_presence_of(:mobile).with_message("Mobile Should not be empty") }

  end

  context 'scope tests' do
    let (:params) { {name: 'test user 1',
        email: 'testuser1@mail.com',
        mobile: '9999999999',
        booking_date: '2021/12/20',
        from_time:'12:00:00',
        to_time: '14:00:00',
        status: '1' } }
    before(:each) do
      user = Booking.new(params.merge(status: 1)).save
      user = Booking.new(params.merge(status: 0)).save
      user = Booking.new(params.merge(status: 0)).save
    end

    it 'should return booked meeting rooms count' do
      expect(Booking.booked.size).to eq(1)
    end

    it 'should return available meeting rooms count' do
      expect(Booking.unbooked.size).to eq(2)
    end  
  end 

end
