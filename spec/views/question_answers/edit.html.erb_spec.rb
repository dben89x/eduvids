require 'rails_helper'

RSpec.describe "question_answers/edit", type: :view do
  before(:each) do
    @question_answer = assign(:question_answer, QuestionAnswer.create!())
  end

  it "renders the edit question_answer form" do
    render

    assert_select "form[action=?][method=?]", question_answer_path(@question_answer), "post" do
    end
  end
end
