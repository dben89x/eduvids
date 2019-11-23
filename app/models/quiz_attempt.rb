class QuizAttempt < ApplicationRecord
  belongs_to :quiz
  belongs_to :user

  delegate :question_count, to: :quiz
end
