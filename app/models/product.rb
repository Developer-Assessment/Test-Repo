class Product < ApplicationRecord
  validates :name, presence: { message: 'Product name should not be empty' }
  validates :code, presence: { message: 'Product code Should not be empty' },
                   uniqueness: { case_sensitive: false, message: 'Product code already taken' }
end
