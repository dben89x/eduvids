require 'faker'
module UserSeeds

  def self.create_rick_and_morty_users(amount=50)
    names = 1000.times.map {Faker::TvShows::RickAndMorty.character}.uniq
    create_users(names, amount)
  end

  def self.create_game_of_thrones_users(amount=50)
    names = 1000.times.map {Faker::TvShows::GameOfThrones.character}.uniq
    create_users(names, amount)
  end

  def self.create_users(names, amount)
    names.select{|n| n.split.count == 2}.first(amount).each do |name|
      first_name = name.gsub('.','').split[0]
      last_name = name.gsub('.','').split[1]
      create_user(first_name, last_name)
    end
  end

  def self.create_user(first_name, last_name, email=nil, password='asdfasdf', avatar=Faker::Avatar.image)
    User.create(
      email: email || Faker::Internet.free_email("#{first_name} #{last_name}"),
      password: password,
      # first_name: first_name,
      # last_name: last_name,
      # remote_avatar_url: avatar,
    )
  end
end

# stuff = 1000.times.map {Faker::Hacker.say_something_smart}.uniq
