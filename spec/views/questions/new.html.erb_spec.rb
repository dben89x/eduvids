require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      :quiz_id => "",
      :body => "MyText",
      :position => 1,
      :question_type => 1,
      :answer_id => ""
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input[name=?]", "question[quiz_id]"

      assert_select "textarea[name=?]", "question[body]"

      assert_select "input[name=?]", "question[position]"

      assert_select "input[name=?]", "question[question_type]"

      assert_select "input[name=?]", "question[answer_id]"
    end
  end
end
