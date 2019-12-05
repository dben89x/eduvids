# == Schema Information
#
# Table name: certificates
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Certificate < ApplicationRecord
  belongs_to :user
  has_many :certificate_attempts, dependent: :destroy
  has_many :quiz_attempts, through: :certificate_attempt
end
