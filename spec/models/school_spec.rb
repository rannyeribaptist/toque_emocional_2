require 'rails_helper'

RSpec.describe School, type: :model do
  context "create school" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:color) }
  end
end
