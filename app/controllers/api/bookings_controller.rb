class Api::BookingsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    booking = Booking.all
    render json: { message: "Success" }, status: 200
  end  

  def create
    booking = Booking.new(booking_params)
    if booking&.save
      render json: { message: "Booking Created Successfully", errors: nil}, status: 200
    else
      render json: { message: "Failed To Create Booking", errors: booking&.errors&.messages}, status: 406
    end
    
  end

  private
  def booking_params
    params.permit(:name, :email, :mobile, :booking_date, :from_time, :to_time)
  end
end
