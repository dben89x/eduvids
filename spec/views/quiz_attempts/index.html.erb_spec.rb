require 'rails_helper'

RSpec.describe "quiz_attempts/index", type: :view do
  before(:each) do
    assign(:quiz_attempts, [
      QuizAttempt.create!(),
      QuizAttempt.create!()
    ])
  end

  it "renders a list of quiz_attempts" do
    render
  end
end
