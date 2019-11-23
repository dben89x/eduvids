class Question < ApplicationRecord
  belongs_to :quiz
  has_many :question_answers
  enum question_type: %i[multiple_choice true_false]
end