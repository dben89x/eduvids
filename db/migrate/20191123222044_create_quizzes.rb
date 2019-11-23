class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.belongs_to :video
      t.integer :status
      t.timestamps
    end
  end
end
