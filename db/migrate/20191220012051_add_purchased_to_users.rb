class AddPurchasedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :purchased, :boolean, default: false
  end
end
