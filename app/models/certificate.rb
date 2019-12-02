class Certificate < ApplicationRecord
  belongs_to :user
  has_many :certificate_attempts, dependent: :destroy
  has_many :quiz_attempts, through: :certificate_attempt
end
