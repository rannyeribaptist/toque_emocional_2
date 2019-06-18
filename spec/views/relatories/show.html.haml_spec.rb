require 'rails_helper'

RSpec.describe "relatories/show", type: :view do
  before(:each) do
    @relatory = assign(:relatory, Relatory.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
