require 'rails_helper'

RSpec.describe "question_answers/index", type: :view do
  before(:each) do
    assign(:question_answers, [
      QuestionAnswer.create!(),
      QuestionAnswer.create!()
    ])
  end

  it "renders a list of question_answers" do
    render
  end
end
