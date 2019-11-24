class Quiz < ApplicationRecord
  belongs_to :video

  has_many :questions
  has_many :answers, through: :questions

  enum status: %i[published unpublished]

  def question_count
    questions.count
  end
end
