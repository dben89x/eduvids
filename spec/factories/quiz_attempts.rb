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

FactoryBot.define do
  factory :quiz_attempt do
    
  end
end
