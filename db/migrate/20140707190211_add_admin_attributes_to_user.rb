class AddAdminAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin_attributes, :boolean, :default => false
  end
end
