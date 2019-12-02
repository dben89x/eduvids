class AddQuestionAttemptReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :question_answers, :quiz_attempt
  end
end
