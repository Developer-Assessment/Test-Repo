require 'rails_helper'

RSpec.describe 'Api::Products', type: :request do
  describe 'Create Product' do
    let(:product_params) do
      {
        name: 'test product',
        code: 'PROD01'
      }
    end

    context 'To check object' do
      let(:new_product) { Product.new(product_params) }
      let(:create_product) { Product.create(product_params) }

      it 'saves product' do
        expect { create_product }.to change { Product.count }.by(1)
      end

      it 'initializes new object of product' do
        expect(new_product).to be_an(Product)
      end
    end

    context 'For Success' do
      before do
        post '/api/products/create', params: product_params
      end

      it 'returns http status success' do
        expect(response).to have_http_status(201)
      end

      it 'returns succees message' do
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq('Product Created Successfully')
      end
    end

    context 'For name validation failure' do
      before do
        product_params[:name] = nil
        post '/api/products/create', params: product_params
      end

      it_behaves_like 'checks failure status'
    end

    context 'For code validation failure' do
      before do
        product_params[:code] = nil
        post '/api/products/create', params: product_params
      end

      it_behaves_like 'checks failure status'
    end
  end
end
