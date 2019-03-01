require 'rails_helper'

RSpec.describe BookComment, type: :model do
  context "should validate fields" do
    it { should validate_presence_of(:guest) }
    it { should validate_presence_of(:book) }
    it { should validate_presence_of(:comment) }
  end
end
