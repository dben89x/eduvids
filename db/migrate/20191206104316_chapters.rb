class Chapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.timestamps
    end

    add_reference :videos, :chapter
  end
end
