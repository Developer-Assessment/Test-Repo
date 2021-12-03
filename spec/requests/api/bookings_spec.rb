require 'rails_helper'

RSpec.describe "Api::Bookings", type: :request do
  
  describe 'Create Booking' do
    it "should return success status" do
      request_params = {
        name: "user 1", 
        email: "user1@mail.com", 
        mobile: "98547854", 
        booking_date: "2021/12/05", 
        from_time:"12:00:00", 
        to_time: "14:00:00"
      }
      post '/api/bookings/create', params: request_params, as: :json
      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq("Booking Created Successfully")
      expect(json_response['errors']).to eq(nil)
    end

    it "should return failure status" do
      request_params = {
        name: "user 1", 
        email: "aaa@eer.kk", 
        mobile: "", 
        booking_date: "2021/12/05", 
        from_time:"12:00:00", 
        to_time: "14:00:00"
      }
      post '/api/bookings/create', params: request_params, as: :json
      expect(response).to have_http_status(406)
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq("Failed To Create Booking")
      expect(json_response['errors']).not_to be_nil
    end

  end

end
