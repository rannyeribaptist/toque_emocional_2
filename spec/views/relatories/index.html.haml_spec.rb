require 'rails_helper'

RSpec.describe "relatories/index", type: :view do
  before(:each) do
    assign(:relatories, [
      Relatory.create!(),
      Relatory.create!()
    ])
  end

  it "renders a list of relatories" do
    render
  end
end
