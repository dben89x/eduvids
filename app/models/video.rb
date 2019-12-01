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
  has_many :quizzes

  enum status: %i[published unpublished]

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
