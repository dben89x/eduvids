class Video < ApplicationRecord
  has_many :quizzes

  enum status: %i[published unpublished]
end
