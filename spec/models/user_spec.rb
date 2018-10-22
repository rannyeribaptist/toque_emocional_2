require 'rails_helper'

RSpec.describe User, type: :model do
  context "User registration" do
    it { should validate_presence_of(:name).on(:update) }
    it { should validate_presence_of(:city).on(:update) }
    it { should validate_presence_of(:state).on(:update) }
    it { should validate_presence_of(:segment).on(:update) }
    it { should validate_presence_of(:role).on(:update) }

    it "Should have an email and password" do
      user = User.create(
        email: "user@test.com",
        password: "123123",
        password_confirmation: "123123",
        name: "user",
        city: "test",
        state: "test",
        segment: "test"
      )

      expect(user.valid?).to be_truthy
    end

    it "Should not be an admin" do
      user = User.create(
        email: "user@test.com",
        password: "123123",
        password_confirmation: "123123",
        name: "user",
        city: "test",
        state: "test",
        segment: "test"
      )

      expect(user.role).to eql("user")
    end
  end
end
