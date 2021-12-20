class Booking < ApplicationRecord
  validates :name, :presence => { message: "Name should not be empty"}
  validates :email, :presence => { message: "Email Should not be empty"}
  validates :mobile, :presence => { message: "Mobile Should not be empty"}
  scope :booked, -> { where(status: 1) }
  scope :unbooked, -> { where(status: 0) }
  
end
