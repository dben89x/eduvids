# == Schema Information
#
# Table name: quiz_attempts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  quiz_id    :bigint
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class QuizAttempt < ApplicationRecord
  belongs_to :quiz
  belongs_to :user

  delegate :question_count, to: :quiz
  scope :completed, -> {where(status: ['passed', 'failed'])}

  enum status: %i[pending passed failed]
end
