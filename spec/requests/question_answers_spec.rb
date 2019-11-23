require 'rails_helper'

RSpec.describe "QuestionAnswers", type: :request do
  describe "GET /question_answers" do
    it "works! (now write some real specs)" do
      get question_answers_path
      expect(response).to have_http_status(200)
    end
  end
end
