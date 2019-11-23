require 'rails_helper'

RSpec.describe "QuizAttempts", type: :request do
  describe "GET /quiz_attempts" do
    it "works! (now write some real specs)" do
      get quiz_attempts_path
      expect(response).to have_http_status(200)
    end
  end
end
