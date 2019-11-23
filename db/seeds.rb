require_relative '../lib/seed_helpers/seed_helper.rb'
include SeedHelper

if Rails.env.test? || Rails.env.development?
  UserSeeds.create_rick_and_morty_users
elsif Rails.env.staging?
  UserSeeds.create_game_of_thrones_users
end
