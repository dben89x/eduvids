# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

class Tag < ApplicationRecord
end
