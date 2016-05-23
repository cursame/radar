class RemoveDescriptionFromVictim < ActiveRecord::Migration
  def change
    remove_column :victims, :description, :text
  end
end
