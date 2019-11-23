require 'rails_helper'

RSpec.describe "quiz_attempts/new", type: :view do
  before(:each) do
    assign(:quiz_attempt, QuizAttempt.new())
  end

  it "renders new quiz_attempt form" do
    render

    assert_select "form[action=?][method=?]", quiz_attempts_path, "post" do
    end
  end
end
