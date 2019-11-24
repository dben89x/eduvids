class Question < ApplicationRecord
  belongs_to :quiz
  belongs_to :answer, optional: true
  has_many :question_answers
  has_many :answers
  enum question_type: %i[multiple_choice true_false]
end
