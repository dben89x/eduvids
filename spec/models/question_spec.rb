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

require 'rails_helper'

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
