require 'rails_helper'

RSpec.describe "quiz_attempts/edit", type: :view do
  before(:each) do
    @quiz_attempt = assign(:quiz_attempt, QuizAttempt.create!())
  end

  it "renders the edit quiz_attempt form" do
    render

    assert_select "form[action=?][method=?]", quiz_attempt_path(@quiz_attempt), "post" do
    end
  end
end
