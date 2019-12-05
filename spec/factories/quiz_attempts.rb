# == Schema Information
#
# Table name: quiz_attempts
#
#  id                     :bigint           not null, primary key
#  quiz_id                :bigint
#  status                 :integer          default("pending")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  certificate_attempt_id :bigint
#

FactoryBot.define do
  factory :quiz_attempt do
    
  end
end
