class AddQaDefaults < ActiveRecord::Migration[6.0]
  def change
    change_column_default :quiz_attempts, :status, from: nil, to: 0
    remove_reference :question_answers, :user
  end
end
