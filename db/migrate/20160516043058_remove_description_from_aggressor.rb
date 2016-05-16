class RemoveDescriptionFromAggressor < ActiveRecord::Migration
  def change
    remove_column :aggressors, :description, :text
  end
end
