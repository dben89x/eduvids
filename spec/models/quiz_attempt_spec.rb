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

require 'rails_helper'

RSpec.describe QuizAttempt, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
