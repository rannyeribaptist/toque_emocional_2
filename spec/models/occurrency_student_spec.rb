require 'rails_helper'

RSpec.describe OccurrencyStudent, type: :model do
  context "must validate fields" do
    it { should validate_presence_of(:student) }
    it { should validate_presence_of(:name) }
  end
end
