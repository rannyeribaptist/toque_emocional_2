require 'rails_helper'

RSpec.describe Appointment, type: :model do
  context "must validate fields" do
    it { should validate_presence_of(:appointment_date) }
    it { should validate_presence_of(:appointment_time) }
    it { should validate_presence_of(:reason) }
    it { should validate_presence_of(:student_id) }
    it { should validate_presence_of(:school_id) }
  end
end
