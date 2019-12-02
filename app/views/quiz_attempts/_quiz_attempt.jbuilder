json.extract! quiz_attempt, :id, :quiz_id, :user_id
json.url quiz_attempt_url(quiz_attempt, format: :json)
