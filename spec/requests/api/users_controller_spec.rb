require 'rails_helper'

RSpec.describe "Api::Users", type: :request do
  
  describe "Create User" do
    let(:request_params) do
      {
        name: "skb",
        email: "skb@mail.com",
        mobile: "9876464",
        password: "12345678"
      }
    end
    context "For Success" do
      before do
        post "/api/users/create", params: request_params
      end
      
      it "returns http status success" do
        expect(response).to have_http_status(201)
      end

      it "returns succees message" do
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq("User Created Successfully")
      end
    end

    context "For name validation failure" do
      before do
        request_params[:name] = nil
        post "/api/users/create", params: request_params
      end

      it "should return failure status" do
        expect(response).to have_http_status(406)
      end

      it "should have failure message" do
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq("Failed To Create User")
      end

      it "should contain errors" do
        json_response = JSON.parse(response.body)
        expect(json_response['errors']).not_to be_nil
      end
    end

    context "For Email validation failure" do
      before do
        request_params[:email] = nil
        post "/api/users/create", params: request_params
      end

      it "should return failure status" do
        expect(response).to have_http_status(406)
      end

      it "should have failure message" do
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq("Failed To Create User")
      end

      it "should contain errors" do
        json_response = JSON.parse(response.body)
        expect(json_response['errors']).not_to be_nil
      end
    end

    context "For mobile validation failure" do
      before do
        request_params[:mobile] = nil
        post "/api/users/create", params: request_params
      end

      it "should return failure status" do
        expect(response).to have_http_status(406)
      end

      it "should have failure message" do
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq("Failed To Create User")
      end

      it "should contain errors" do
        json_response = JSON.parse(response.body)
        expect(json_response['errors']).not_to be_nil
      end
    end

    context "For password validation failure" do
      before do
        request_params[:password] = '1234'
        post "/api/users/create", params: request_params
      end

      it "should return failure status" do
        expect(response).to have_http_status(406)
      end

      it "should have failure message" do
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq("Failed To Create User")
      end

      it "should contain errors" do
        json_response = JSON.parse(response.body)
        expect(json_response['errors']).not_to be_nil
      end
    end
  end

end
