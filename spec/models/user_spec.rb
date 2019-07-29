require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of :password }
  end

   it "has an api_key" do
     user = User.create!(email: 'a@b.com', password: '123pkd')
     expect(user.api_key).to be_a(String)
     expect(user.api_key.length).to eq(32)
   end
end
