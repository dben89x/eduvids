require 'rails_helper'

RSpec.describe "videos/index", type: :view do
  before(:each) do
    assign(:videos, [
      Video.create!(
        :url => "Url",
        :poster => "Poster",
        :status => 2,
        :title => "Title",
        :description => "MyText",
        :overview => "Overview"
      ),
      Video.create!(
        :url => "Url",
        :poster => "Poster",
        :status => 2,
        :title => "Title",
        :description => "MyText",
        :overview => "Overview"
      )
    ])
  end

  it "renders a list of videos" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Poster".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Overview".to_s, :count => 2
  end
end
