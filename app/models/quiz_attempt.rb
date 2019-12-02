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
  COMPLETION_COUNT = 5

  belongs_to :quiz
  belongs_to :certificate_attempt
  has_many :question_answers, dependent: :destroy

  delegate :question_count, to: :quiz
  delegate :user, to: :certificate_attempt
  scope :completed, -> { where(status: 'complete') }
  scope :pending, -> { where(status: 'pending') }

  enum status: %i[pending complete]

  after_save :update_certificate_status, if: :will_save_change_to_status?

  def state
    case status
    when 'complete' then 'Completed'
    when 'pending' then 'In Progress'
    when nil then 'Not Started'
    end
  end

  def available_questions
    quiz.questions.reject {|question| question_answers.pluck(:question_id).include?(question.id)}
  end

  def random_questions
    available_questions.shuffle.first(5).as_json(
      only: %i[id body question_type],
      methods: :random_answers,
    )
  end

  def random_question
    random_questions[0]
  end

  def answered_questions
    question_answers.count
  end

  def next_attempt
    next_quiz = certificate_attempt.remaining_quizzes[0]
    next_quiz&.video
  end

  def remaining_question_count
    COMPLETION_COUNT - answered_questions
  end

  def complete
    status == 'complete'
  end

  def question_tracker
    "Question #{answered_questions + 1} of #{COMPLETION_COUNT}"
  end

  def react_json
    as_json(
      only: %i[id status],
      methods: %i[random_question state question_tracker remaining_question_count]
    )
  end

  def update_status
    self.status = remaining_question_count > 0 ? 'pending' : 'complete'
    self.save
  end

  def update_certificate_status
    certificate_attempt.update_status
  end
end
