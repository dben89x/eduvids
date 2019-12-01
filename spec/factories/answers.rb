# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  body        :text
#  question_id :bigint
#

FactoryBot.define do
  factory :answer do
    
  end
end
