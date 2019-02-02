require 'rails_helper'

RSpec.describe Occurrency, type: :model do
  context "must validate fields" do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:filled_by) }
    it { should validate_presence_of(:emotional_sphere) }
  end

  context "needs to be at least one student" do
    it "should fail if trying to save without nested students fields" do
      occurrency = Occurrency.new(description: "test", filled_by: "test", emotional_sphere: "test")

      expect(occurrency.save).to be_falsy
    end

    it "should save if at least one nested students fields is present" do
      school = School.create(color: "#ffffff", name: "test")
      student = Student.create(name: "test", classy: "test", groupy: "test", :school_id => school.id)

      occurrency = Occurrency.new(description: "test", filled_by: "test", emotional_sphere: "test")
      occurrency.occurrency_students.new(name: "test", classy: "test", groupy: "test", :student_id => student.id)

      expect(occurrency.save).to be_truthy
    end
  end
end
