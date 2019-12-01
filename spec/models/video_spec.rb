# == Schema Information
#
# Table name: videos
#
#  id          :bigint           not null, primary key
#  url         :string
#  poster      :string
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string
#  description :text
#  overview    :string
#

require 'rails_helper'

RSpec.describe Video, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
