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

class Profile < ApplicationRecord
  belongs_to :user

  SPORTS = ["Baseball", "Softball", "Volleyball", "Basketball", "Flag Football", "Tackle Football", "Soccer", "Cheerleading", "Lacrosse"]
  GENDERS = ["Male", 'Female']
  enum age_level: %i[5u 8u 10u 12u 14u high_school college]

  def complete
    sports.presence &&
    age_level.presence &&
    genders.presence &&
    # years_experience.presence &&
    !previous_training.nil?
  end
end
