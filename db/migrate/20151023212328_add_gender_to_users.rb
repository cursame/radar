class AddGenderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :integer, default: 2, null: false
    add_index :users, :gender
  end
end
