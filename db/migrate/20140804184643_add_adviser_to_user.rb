class AddAdviserToUser < ActiveRecord::Migration
  def change
    add_column :users, :adviser, :boolean
  end
end
