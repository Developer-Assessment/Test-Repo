require 'rails_helper'

RSpec.describe 'Api::Bookings', type: :request do
  describe 'Create Booking' do
    let(:request_params) do
      {
        name: 'user 1',
        email: 'user1@mail.com',
        mobile: '98547854',
        booking_date: '2021/12/05',
        from_time: '12:00:00',
        to_time: '14:00:00'
      }
    end

    context 'For Success' do
      before do
        post '/api/bookings/create', params: request_params, as: :json
      end
      it 'should return success status' do
        expect(response).to have_http_status(200)
      end

      it 'should have success message' do
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq('Booking Created Successfully')
      end
    end

    context 'For failure' do
      before do
        request_params[:email] = nil
        post '/api/bookings/create', params: request_params, as: :json
      end

      it 'should return failure status' do
        expect(response).to have_http_status(406)
      end

      it 'should have failure message' do
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq('Failed To Create Booking')
      end

      it 'should contain errors' do
        json_response = JSON.parse(response.body)
        expect(json_response['errors']).not_to be_nil
      end
    end
  end
end
