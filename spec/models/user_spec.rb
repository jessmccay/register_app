require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have a user id and password" do
    user = User.new(user_id: 'jesca', password: 'mrin')
    user.save

    user2 = User.find_by_user_id("jesca")
    expect(user.password).to eq 'mrin'
  end
end
