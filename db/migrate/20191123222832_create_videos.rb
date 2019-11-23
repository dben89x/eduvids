class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :url
      t.string :poster
      t.integer :status
      t.timestamps
    end
  end
end
