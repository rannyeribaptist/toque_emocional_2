require 'rails_helper'

RSpec.describe "occurrency_histories/edit", type: :view do
  before(:each) do
    @occurrency_history = assign(:occurrency_history, OccurrencyHistory.create!(
      :student => nil,
      :occurrency => nil,
      :emotions => "MyString"
    ))
  end

  it "renders the edit occurrency_history form" do
    render

    assert_select "form[action=?][method=?]", occurrency_history_path(@occurrency_history), "post" do

      assert_select "input[name=?]", "occurrency_history[student_id]"

      assert_select "input[name=?]", "occurrency_history[occurrency_id]"

      assert_select "input[name=?]", "occurrency_history[emotions]"
    end
  end
end
