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

FactoryBot.define do
  factory :question do
    
  end
end
