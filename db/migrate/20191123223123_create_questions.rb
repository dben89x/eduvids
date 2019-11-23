class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.belongs_to :quiz
      t.text :body
      t.integer :position
      t.integer :question_type
      t.timestamps
    end
  end
end
