require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name).with_message('Product name should not be empty') }
    it { should validate_presence_of(:code).with_message('Product code Should not be empty') }
    it { should validate_uniqueness_of(:code).case_insensitive.with_message('Product code already taken') }
  end
end
