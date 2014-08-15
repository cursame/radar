class AddDeliverRedLight < ActiveRecord::Migration
  def change
  	 add_column :red_lights, :deliver, :boolean, default: false
  end
end
