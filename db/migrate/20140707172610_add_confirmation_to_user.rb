class AddConfirmationToUser < ActiveRecord::Migration
  def change
    add_column :users, :confirmation, :boolean
    add_column :users, :confirmed_by, :integer
  end
end
