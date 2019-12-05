# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :rememberable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :question_answers, dependent: :destroy
  has_many :certificate_attempts, dependent: :destroy
  has_many :quiz_attempts, through: :certificate_attempts
  has_one :profile

  after_create :create_profile

  validates_presence_of :first_name, :last_name

  def create_profile
    Profile.create(user: self)
  end

  def admin?
    false
  end

  def current_attempt
    certificate_attempts.last || certificate_attempts.create
  end
end
