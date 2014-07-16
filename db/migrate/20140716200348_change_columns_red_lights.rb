class ChangeColumnsRedLights < ActiveRecord::Migration
  def up
  	 remove_column :red_lights, :cuestion_1
  	 remove_column :red_lights, :cuestion_2
  	 remove_column :red_lights, :cuestion_3
  	 remove_column :red_lights, :cuestion_4
  	 remove_column :red_lights, :cuestion_5
  	 remove_column :red_lights, :cuestion_6
  	 remove_column :red_lights, :cuestion_7
  	 remove_column :red_lights, :cuestion_8
  	 remove_column :red_lights, :cuestion_9
  	 remove_column :red_lights, :cuestion_10
  	 remove_column :red_lights, :cuestion_11
  	 remove_column :red_lights, :cuestion_12
  	 remove_column :red_lights, :cuestion_13
  	 remove_column :red_lights, :cuestion_14
  	 remove_column :red_lights, :cuestion_15
  	 remove_column :red_lights, :cuestion_16
  	 remove_column :red_lights, :cuestion_17
  	 remove_column :red_lights, :cuestion_18
  	 remove_column :red_lights, :cuestion_19
  	 remove_column :red_lights, :cuestion_20
  end
end
