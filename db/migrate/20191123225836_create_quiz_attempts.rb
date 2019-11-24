class CreateQuizAttempts < ActiveRecord::Migration[6.0]
  def change
    create_table :quiz_attempts do |t|
      t.belongs_to :user
      t.belongs_to :quiz
      t.integer :status
      t.timestamps
    end
  end
end
