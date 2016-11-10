require 'rails_helper'

RSpec.describe Phone, type: :model do
  it "should have a number" do
  phone = Phone.new
  phone.number = '123'

  user = User.new
  user.user_id = 'mrin'
  user.save

  phone.user = user

  phone2 = Phone.find_by_number('123')
  expect(phone.save).to eq true
  end
end
