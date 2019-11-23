require 'rails_helper'

RSpec.describe "quiz_attempts/show", type: :view do
  before(:each) do
    @quiz_attempt = assign(:quiz_attempt, QuizAttempt.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
