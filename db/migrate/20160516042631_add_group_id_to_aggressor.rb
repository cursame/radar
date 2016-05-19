class AddGroupIdToAggressor < ActiveRecord::Migration
  def change
    add_column :aggressors, :group_id, :integer
    add_index :aggressors, :group_id
  end
end
