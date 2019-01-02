require 'rails_helper'

RSpec.describe User, type: :model do
  context "must validate fields" do
    it { should validate_presence_of(:school) }
    it { should validate_presence_of(:role) }
  end

  context "can only be one per school" do
    it "should save if school doesn't have an user" do
      school = School.create(:name => "test", color: "#000000")
      user = User.new(school: school, role: "coordenator", email: "test@test.com", password: "123123", password_confirmation: "123123")

      expect(user.save).to be_truthy
    end

    it "should fail saving if the selected school already have an user" do
      school = School.create(:name => "test", color: "#000000")
      user = User.create(school: school, role: "coordenator", email: "test@test.com", password: "123123", password_confirmation: "123123")

      user2 = User.new(school: school, role: "coordenator", email: "test1@test.com", password: "123123", password_confirmation: "123123")

      expect(user2.save).to be_falsy
    end

    it "will return an error message if it fails" do
      school = School.create(:name => "test", color: "#000000")
      user = User.create(school: school, role: "coordenator", email: "test@test.com", password: "123123", password_confirmation: "123123")

      user2 = User.create(school: school, role: "coordenator", email: "test1@test.com", password: "123123", password_confirmation: "123123")

      expect(user2.errors[:base]).to eq(["Essa escola já tem um usuário."])
    end
  end

  context "must only be an admin" do
    it "should validate the user role" do
      school = School.create(:name => "test", color: "#000000")
      school2 = School.create(:name => "test", color: "#000000")

      user = User.create(school: school, role: "Admin", email: "test@test.com", password: "123123", password_confirmation: "123123")
      user2 = User.new(school: school2, role: "Admin", email: "test2@test.com", password: "123123", password_confirmation: "123123")

      expect(user2.save).to be_falsy
    end

    it "will return a error message if it fails" do
      school = School.create(:name => "test", color: "#000000")
      school2 = School.create(:name => "test", color: "#000000")
      
      user = User.create(school: school, role: "Admin", email: "test@test.com", password: "123123", password_confirmation: "123123")
      user2 = User.create(school: school2, role: "Admin", email: "test2@test.com", password: "123123", password_confirmation: "123123")

      expect(user2.errors[:base]).to eq(["Desculpe mas eu não posso permitir que isso aconteça... Este incidente será relatado."])
    end
  end
end
