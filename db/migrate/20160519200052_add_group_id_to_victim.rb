class AddGroupIdToVictim < ActiveRecord::Migration
  def change
    add_column :victims, :group_id, :integer
    add_index :victims, :group_id
  end
end
