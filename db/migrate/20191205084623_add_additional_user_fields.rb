class AddAdditionalUserFields < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    create_table :profiles do |t|
      t.belongs_to :user
      t.text :sports, array: true
      t.integer :age_level
      t.string :genders, array: true
      t.integer :years_experience
      t.boolean :previous_training
    end
  end
end
