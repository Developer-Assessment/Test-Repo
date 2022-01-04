class User < ActiveRecord::Base
  has_secure_password validations: false

  validates :name, presence: { message: 'Name should not be empty' }
  validates :email, presence: { message: 'Email Should not be empty' }
  validates :mobile, presence: { message: 'Mobile Should not be empty' }
  validates :password, length: {
    minimum: 8,
    message: 'Your password must contain at least 8 characters'
  }
end
