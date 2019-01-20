require 'rails_helper'

RSpec.describe "appointments/new", type: :view do
  before(:each) do
    assign(:appointment, Appointment.new(
      :school => nil,
      :student => "",
      :description => "MyText"
    ))
  end

  it "renders new appointment form" do
    render

    assert_select "form[action=?][method=?]", appointments_path, "post" do

      assert_select "input[name=?]", "appointment[school_id]"

      assert_select "input[name=?]", "appointment[student]"

      assert_select "textarea[name=?]", "appointment[description]"
    end
  end
end
