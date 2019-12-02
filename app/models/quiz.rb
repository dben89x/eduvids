# == Schema Information
#
# Table name: quizzes
#
#  id         :bigint           not null, primary key
#  video_id   :bigint
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Quiz < ApplicationRecord
  belongs_to :video

  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions
  has_many :quiz_attempts, dependent: :destroy

  attr_accessor :current_attempt

  enum status: %i[published unpublished]

  def random_questions
    questions.shuffle.first(5).as_json(
      only: %i[id body question_type],
      methods: :random_answers,
    )
  end

  def is_completed(user_id)
    quiz_attempts.where(user_id: user_id)
  end

  def question_count
    questions.count
  end

end
