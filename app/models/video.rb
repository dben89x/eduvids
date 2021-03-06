# == Schema Information
#
# Table name: videos
#
#  id          :bigint           not null, primary key
#  url         :string
#  poster      :string
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string
#  description :text
#  overview    :string
#

class Video < ApplicationRecord
  belongs_to :chapter

  has_many :quizzes, dependent: :destroy
  has_many :quiz_attempts, through: :quizzes
  has_many :questions, through: :quizzes

  enum status: %i[published unpublished]
  validates :quizzes, length: { maximum: 1 }

  def quiz
    quizzes.last
  end

  def react_json
    self.as_json(
      only: %i[id url title description],
      include: {
        quizzes: {
          only: %i[],
          methods: :random_questions
        }
      }
    )
  end
end
