require 'rails_helper'

RSpec.describe "question_answers/new", type: :view do
  before(:each) do
    assign(:question_answer, QuestionAnswer.new())
  end

  it "renders new question_answer form" do
    render

    assert_select "form[action=?][method=?]", question_answers_path, "post" do
    end
  end
end
