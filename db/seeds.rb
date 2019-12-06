require_relative '../lib/seed_helpers/seed_helper.rb'
include SeedHelper

# file = File.read('./data/data.json')

if User.all.empty?
  if Rails.env.test? || Rails.env.development?
    UserSeeds.create_rick_and_morty_users
  elsif Rails.env.staging?
    UserSeeds.create_game_of_thrones_users
  end
end

# if Rails.env.development?
  Answer.destroy_all
  CertificateAttempt.destroy_all
  Certificate.destroy_all
  QuestionAnswer.destroy_all
  Question.destroy_all
  QuizAttempt.destroy_all
  Quiz.destroy_all
  Tag.destroy_all
  Video.destroy_all
  Chapter.destroy_all
# end

file = File.read('db/data/data.json')
hash = JSON.parse(file)

hash.each do |set|
  chapter = Chapter.find_by(id: set['video']['chapter_id']) || Chapter.create(id: set['video']['chapter_id'])
  video = Video.create(
    title: set['video']['title'],
    url: set['video']['url'],
    chapter: chapter,
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
