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

FactoryBot.define do
  factory :video do
    
  end
end
