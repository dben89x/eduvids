require_relative '../lib/seed_helpers/seed_helper.rb'
include SeedHelper

if User.all.empty?
  if Rails.env.test? || Rails.env.development?
    UserSeeds.create_rick_and_morty_users
  elsif Rails.env.staging?
    UserSeeds.create_game_of_thrones_users
  end
end

5.times do
  Tag.create(
    name: Faker::Lorem.sentence(word_count: (1..2).to_a.sample)
  )
end
10.times do
  video = Video.create(
    title: Faker::Lorem.sentence(word_count: 10),
    overview: Faker::Lorem.paragraph(sentence_count: 5),
    description: Faker::Lorem.paragraph(sentence_count: 15),
    url: 'https://www.youtube.com/embed/6jJkdRaa04g',
    status: 'published'
  )
  quiz = Quiz.create(
    video: video,
    status: 'published'
  )
  (3..6).to_a.sample.times do |i|
    question_type = ['multiple_choice', 'true_false'].sample
    question = Question.create(
      quiz: quiz,
      question_type: question_type,
      position: i,
      body: Faker::Hipster.paragraph(sentence_count: (2..8).to_a.sample),
    )
    if question_type == 'multiple_choice'
      (3..5).to_a.sample.times do
        Answer.create(
          body: Faker::Hipster.paragraph(sentence_count: (1..4).to_a.sample),
          question: question
        )
      end
    elsif question_type == 'true_false'
      Answer.create(body: 'true', question: question)
      Answer.create(body: 'false', question: question)
    end
    question.answer = question.answers.sample
    question.save
  end
end
