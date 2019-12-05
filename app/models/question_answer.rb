# == Schema Information
#
# Table name: question_answers
#
#  id              :bigint           not null, primary key
#  question_id     :bigint
#  answer_id       :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  quiz_attempt_id :bigint
#  correct         :boolean
#

class QuestionAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :answer
  belongs_to :quiz_attempt

  delegate :user, to: :quiz_attempt
  delegate :quiz, to: :quiz_attempt

  after_save :update_quiz_attempt
  before_destroy :update_quiz_attempt
  before_save :update_status

  def update_quiz_attempt
    quiz_attempt.update_status
  end

  def update_status
    self.correct = question.answer == answer
  end
end
