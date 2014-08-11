class AddAdviserCodeToUser < ActiveRecord::Migration
  def change
    add_column :users, :adviser_code, :integer
  end
end
