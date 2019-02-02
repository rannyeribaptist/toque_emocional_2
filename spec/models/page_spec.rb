require 'rails_helper'

RSpec.describe Page, type: :model do
  context "must validate fields" do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:content) }
  end
end
