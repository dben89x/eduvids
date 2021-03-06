# == Schema Information
#
# Table name: questions
#
#  id            :bigint           not null, primary key
#  quiz_id       :bigint
#  body          :text
#  position      :integer
#  question_type :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  answer_id     :bigint
#

class Question < ApplicationRecord
  belongs_to :quiz
  belongs_to :answer, optional: true
  has_many :question_answers, dependent: :destroy
  has_many :answers, dependent: :destroy
  enum question_type: %i[multiple_choice true_false]

  # before_create :assign_tf_answers

  def random_answers
    answers.shuffle.first(5).as_json(
      only: %i[id body]
    )
  end

  def assign_tf_answers
    if question_type == 'true_false' && answers.empty?
      answers.create(body: 'true')
      answers.create(body: 'false')
    end
  end

end
