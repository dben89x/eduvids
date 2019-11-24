require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        :quiz_id => "",
        :body => "MyText",
        :position => 2,
        :question_type => 3,
        :answer_id => ""
      ),
      Question.create!(
        :quiz_id => "",
        :body => "MyText",
        :position => 2,
        :question_type => 3,
        :answer_id => ""
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
