require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name).with_message('Name should not be empty') }
    it { should validate_presence_of(:email).with_message('Email Should not be empty') }
    it { should validate_presence_of(:mobile).with_message('Mobile Should not be empty') }
    it {
      should validate_length_of(:password).is_at_least(8)
                                          .with_message('Your password must contain at least 8 characters')
    }
  end
end
