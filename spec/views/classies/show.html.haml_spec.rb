require 'rails_helper'

RSpec.describe "classies/show", type: :view do
  before(:each) do
    @classy = assign(:classy, Classy.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
