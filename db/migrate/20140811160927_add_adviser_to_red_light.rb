class AddAdviserToRedLight < ActiveRecord::Migration
  def change
    add_column :red_lights, :adviser, :integer
  end
end
