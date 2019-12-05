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

require 'rails_helper'

RSpec.describe Profile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
