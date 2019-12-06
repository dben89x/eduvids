require_relative '../lib/seed_helpers/seed_helper.rb'
include SeedHelper

file = File.read('./data/data.json')
hash = JSON.parse(file)

if User.all.empty?
  if Rails.env.test? || Rails.env.development?
    UserSeeds.create_rick_and_morty_users
  elsif Rails.env.staging?
    UserSeeds.create_game_of_thrones_users
  end
end

hash.each do |set|
  video = Video.create(
    title: set['video']['title'],
    url: set['video']['url'],
  )
  quiz = Quiz.create(
    video: video,
  )
  set['quiz']['questions'].each do |question_data|
    question = Question.create(
      quiz: quiz,
      question_type: question_data['question_type'],
      body: question_data['body'],
    )
    answer = nil
    question_data['answers'].each do |answer_data|
      answer = Answer.create(
        body: answer_data['body'],
        question: question
      )
    end
    question.answer = answer
    question.save
  end
end


# if Rails.env.development?
#   Answer.destroy_all
#   CertificateAttempt.destroy_all
#   Certificate.destroy_all
#   QuestionAnswer.destroy_all
#   Question.destroy_all
#   QuizAttempt.destroy_all
#   Quiz.destroy_all
#   Tag.destroy_all
#   Video.destroy_all
# end

# 5.times do
#   Tag.create(
#     name: Faker::Lorem.sentence(word_count: (1..2).to_a.sample)
#   )
# end
# 20.times do
#   video = Video.create(
#     title: Faker::Lorem.sentence(word_count: 10),
#     overview: Faker::Lorem.paragraph(sentence_count: 5),
#     description: Faker::Lorem.paragraph(sentence_count: 15),
#     url: 'https://www.youtube.com/embed/6jJkdRaa04g',
#     status: 'published'
#   )
#   quiz = Quiz.create(
#     video: video,
#     status: 'published'
#   )
#   (10..15).to_a.sample.times do |i|
#     question_type = ['multiple_choice', 'true_false'].sample
#     question = Question.create(
#       quiz: quiz,
#       question_type: question_type,
#       position: i,
#       body: Faker::Hipster.paragraph(sentence_count: (2..8).to_a.sample),
#     )
#     if question_type == 'multiple_choice'
#       (3..10).to_a.sample.times do
#         Answer.create(
#           body: Faker::Hipster.paragraph(sentence_count: (1..4).to_a.sample),
#           question: question
#         )
#       end
#     elsif question_type == 'true_false'
#       Answer.create(body: 'true', question: question)
#       Answer.create(body: 'false', question: question)
#     end
#     question.answer = question.answers.sample
#     question.save
#   end
# end
