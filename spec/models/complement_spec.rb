require 'rails_helper'

RSpec.describe Complement, type: :model do
  context "must validate fields" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:file) }
  end
end
