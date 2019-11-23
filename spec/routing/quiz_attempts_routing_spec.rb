require "rails_helper"

RSpec.describe QuizAttemptsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/quiz_attempts").to route_to("quiz_attempts#index")
    end

    it "routes to #new" do
      expect(:get => "/quiz_attempts/new").to route_to("quiz_attempts#new")
    end

    it "routes to #show" do
      expect(:get => "/quiz_attempts/1").to route_to("quiz_attempts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/quiz_attempts/1/edit").to route_to("quiz_attempts#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/quiz_attempts").to route_to("quiz_attempts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/quiz_attempts/1").to route_to("quiz_attempts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/quiz_attempts/1").to route_to("quiz_attempts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/quiz_attempts/1").to route_to("quiz_attempts#destroy", :id => "1")
    end
  end
end
