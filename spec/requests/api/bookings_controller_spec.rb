require 'rails_helper'

RSpec.describe "Api::Bookings", type: :request do
  
  describe 'Create Booking' do
    request_params_success_case = {
      name: "user 1", 
      email: "user1@mail.com", 
      mobile: "98547854", 
      booking_date: "2021/12/05", 
      from_time:"12:00:00", 
      to_time: "14:00:00"
    }

    request_params_failure_case = {
      name: "user 1", 
      email: "aaa@eer.kk", 
      mobile: "", 
      booking_date: "2021/12/05", 
      from_time:"12:00:00", 
      to_time: "14:00:00"
    }
    it "should return success status" do
      post '/api/bookings/create', params: request_params_success_case, as: :json
      expect(response).to have_http_status(200)
    end

    it "should have success message" do
      post '/api/bookings/create', params: request_params_success_case, as: :json
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq("Booking Created Successfully")
    end

    it "should return failure status" do
      post '/api/bookings/create', params: request_params_failure_case, as: :json
      expect(response).to have_http_status(406)
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq("Failed To Create Booking")
      expect(json_response['errors']).not_to be_nil
    end

    it "should have failure message" do
      post '/api/bookings/create', params: request_params_failure_case, as: :json
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq("Failed To Create Booking")
    end

    it "should contain errors" do
      post '/api/bookings/create', params: request_params_failure_case, as: :json
      json_response = JSON.parse(response.body)
      expect(json_response['errors']).not_to be_nil
    end

  end

end
