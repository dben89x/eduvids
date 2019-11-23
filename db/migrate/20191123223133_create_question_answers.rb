class CreateQuestionAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :question_answers do |t|
      t.belongs_to :question
      t.belongs_to :answer
      t.belongs_to :user
      t.timestamps
    end
  end
end
