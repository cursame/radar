class AddConfirmationToUser < ActiveRecord::Migration
  def change
    add_column :users, :confirmation, :boolean, :default => false
    add_column :users, :confirmed_by, :integer
  end
end
