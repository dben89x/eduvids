# == Schema Information
#
# Table name: profiles
#
#  id                :bigint           not null, primary key
#  user_id           :bigint
#  sports            :text             is an Array
#  age_level         :integer
#  genders           :string           is an Array
#  years_experience  :integer
#  previous_training :boolean
#

FactoryBot.define do
  factory :profile do
    
  end
end
