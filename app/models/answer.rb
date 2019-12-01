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

class Answer < ApplicationRecord
  belongs_to :question
end
