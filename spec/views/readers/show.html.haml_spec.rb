require 'rails_helper'

RSpec.describe "readers/show", type: :view do
  before(:each) do
    @reader = assign(:reader, Reader.create!(
      :name => "Name",
      :classy => "Classy",
      :groupy => "Groupy",
      :school => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Classy/)
    expect(rendered).to match(/Groupy/)
    expect(rendered).to match(//)
  end
end
