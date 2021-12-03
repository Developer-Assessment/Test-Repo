class Booking < ApplicationRecord
  validates :name, presense: { message: "Name should not be empty"}
  validates :email, presense: { message: "Email Should not be empty"}
  validates :mobile, presense: { message: "Mobile Should not be empty"}
  
end
