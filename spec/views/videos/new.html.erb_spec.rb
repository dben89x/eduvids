require 'rails_helper'

RSpec.describe "videos/new", type: :view do
  before(:each) do
    assign(:video, Video.new(
      :url => "MyString",
      :poster => "MyString",
      :status => 1,
      :title => "MyString",
      :description => "MyText",
      :overview => "MyString"
    ))
  end

  it "renders new video form" do
    render

    assert_select "form[action=?][method=?]", videos_path, "post" do

      assert_select "input[name=?]", "video[url]"

      assert_select "input[name=?]", "video[poster]"

      assert_select "input[name=?]", "video[status]"

      assert_select "input[name=?]", "video[title]"

      assert_select "textarea[name=?]", "video[description]"

      assert_select "input[name=?]", "video[overview]"
    end
  end
end
