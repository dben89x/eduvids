class AddAnswerFields < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :body, :text
    add_reference :questions, :answer, index: true
    add_reference :answers, :question, index: true
  end
end
