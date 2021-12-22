require 'rails_helper'

RSpec.describe ImageFlipper, type: :model do
  it "calls the flip method with the correct arguments" do
    mock = double("mini_magick")
    expect(mock).to receive(:flip).with("ruby.jpg")
    img = ImageFlipper.new(mock)
    img.flip("ruby.jpg")
  end
end
