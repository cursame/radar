class AddHistoryAndAggressorsToRedLight < ActiveRecord::Migration
  def change
    add_column :red_lights, :history, :text
    add_column :red_lights, :aggressors, :text
  end
end
