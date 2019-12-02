class AddCorrectToQuestionAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :question_answers, :correct, :boolean
  end
end
