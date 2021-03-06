require 'rails_helper'

RSpec.describe "appointments/edit", type: :view do
  before(:each) do
    @appointment = assign(:appointment, Appointment.create!(
      :school => nil,
      :student => "",
      :description => "MyText"
    ))
  end

  it "renders the edit appointment form" do
    render

    assert_select "form[action=?][method=?]", appointment_path(@appointment), "post" do

      assert_select "input[name=?]", "appointment[school_id]"

      assert_select "input[name=?]", "appointment[student]"

      assert_select "textarea[name=?]", "appointment[description]"
    end
  end
end
