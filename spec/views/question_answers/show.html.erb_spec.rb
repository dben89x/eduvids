require 'rails_helper'

RSpec.describe "question_answers/show", type: :view do
  before(:each) do
    @question_answer = assign(:question_answer, QuestionAnswer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
