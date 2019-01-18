require 'rails_helper'

RSpec.describe Student, type: :model do
  context "validate fields" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:school) }
    it { should validate_presence_of(:classy) }
    it { should validate_presence_of(:groupy) }
  end
end
