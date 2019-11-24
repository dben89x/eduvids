require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :quiz_id => "",
      :body => "MyText",
      :position => 1,
      :question_type => 1,
      :answer_id => ""
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do

      assert_select "input[name=?]", "question[quiz_id]"

      assert_select "textarea[name=?]", "question[body]"

      assert_select "input[name=?]", "question[position]"

      assert_select "input[name=?]", "question[question_type]"

      assert_select "input[name=?]", "question[answer_id]"
    end
  end
end
