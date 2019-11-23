require_relative './user_seeds.rb'

module SeedHelper
  include UserSeeds

  ############################################################
  # DANGER ZONE !!!!!!
  ############################################################
  # Never use this in any environment other than dev.
  # If you must use it in another environment, copy the code and do it manually.
  def self.destroy_all_humans
    if Rails.env.development?
      User.destroy_all
    end
  end
end
