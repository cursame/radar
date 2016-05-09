class AddGroupIdToDenouncer < ActiveRecord::Migration
  def change
    add_column :denouncers, :group_id, :integer
    add_index :denouncers, :group_id
  end
end
