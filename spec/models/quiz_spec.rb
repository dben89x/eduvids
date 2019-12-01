# == Schema Information
#
# Table name: quizzes
#
#  id         :bigint           not null, primary key
#  video_id   :bigint
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Quiz, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
