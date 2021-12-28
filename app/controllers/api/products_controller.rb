class Api::ProductsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    product = Product.new(product_params)
    if product.save
      render json: { message: "Product Created Successfully", errors: nil}, status: 201
    else
      render json: { message: "Failed To Create Product", errors: product.errors.messages}, status: 406
    end
  end

  private

  def product_params
    params.permit(:name, :code)
  end

end
