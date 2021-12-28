class Api::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    user = User.new(user_params)
    if user.save
      render json: { message: "User Created Successfully", errors: nil}, status: 201
    else
      render json: { message: "Failed To Create User", errors: user.errors.messages}, status: 406
    end
  end

  private
  
  def user_params
    params.permit(:name, :email, :mobile, :password)
  end
end
