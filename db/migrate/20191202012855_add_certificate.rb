class AddCertificate < ActiveRecord::Migration[6.0]
  def change
    create_table :certificates do |t|
      t.belongs_to :user
      t.integer :status
      t.timestamps
    end

    create_table :certificate_attempts do |t|
      t.belongs_to :user
      t.belongs_to :certificate
      t.integer :status
      t.timestamps
    end

    add_reference :quiz_attempts, :certificate_attempt, index: true
    change_column_default :certificate_attempts, :status, from: nil, to: 0
    remove_reference :quiz_attempts, :user
  end
end
