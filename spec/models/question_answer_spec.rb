# == Schema Information
#
# Table name: question_answers
#
#  id          :bigint           not null, primary key
#  question_id :bigint
#  answer_id   :bigint
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe QuestionAnswer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
