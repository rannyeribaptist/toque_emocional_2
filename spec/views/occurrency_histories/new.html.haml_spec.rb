require 'rails_helper'

RSpec.describe "occurrency_histories/new", type: :view do
  before(:each) do
    assign(:occurrency_history, OccurrencyHistory.new(
      :student => nil,
      :occurrency => nil,
      :emotions => "MyString"
    ))
  end

  it "renders new occurrency_history form" do
    render

    assert_select "form[action=?][method=?]", occurrency_histories_path, "post" do

      assert_select "input[name=?]", "occurrency_history[student_id]"

      assert_select "input[name=?]", "occurrency_history[occurrency_id]"

      assert_select "input[name=?]", "occurrency_history[emotions]"
    end
  end
end
