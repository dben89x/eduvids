# == Schema Information
#
# Table name: certificate_attempts
#
#  id             :bigint           not null, primary key
#  user_id        :bigint
#  certificate_id :bigint
#  status         :integer          default("pending")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class CertificateAttempt < ApplicationRecord
  PASS_RATIO = 0.8

  belongs_to :user
  belongs_to :certificate, optional: true
  has_many :quiz_attempts, dependent: :destroy
  has_many :question_answers, through: :quiz_attempts

  scope :completed, -> { where(status: ['passed', 'failed']) }
  scope :pending, -> { where(status: 'pending') }

  enum status: %i[pending passed failed]

  def complete
    status == 'passed' || status == 'failed'
  end

  def remaining_quizzes
    Quiz.all.select {|quiz| quiz_attempts.completed.where(quiz: quiz).empty?}
  end

  def correct_answers_count
    question_answers.where(correct: true).count
  end

  def result
    correct_answers_count.to_f / question_answers.count
  end

  def update_status
    if remaining_quizzes.count > 0
      self.status = 'pending'
    else
      self.status = result >= PASS_RATIO ? 'passed' : 'failed'
    end
    self.save
  end

end
