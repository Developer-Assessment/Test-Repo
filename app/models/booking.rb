class Booking < ApplicationRecord
  validates :name, :presence => { message: "Name should not be empty"}
  validates :email, :presence => { message: "Email Should not be empty"}
  validates :mobile, :presence => { message: "Mobile Should not be empty"}
  
end
