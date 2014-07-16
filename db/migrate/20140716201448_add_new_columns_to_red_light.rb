class AddNewColumnsToRedLight < ActiveRecord::Migration
  def change
  	 add_column :red_lights, :question_1, :boolean, :default => false
  	 add_column :red_lights, :question_2, :boolean, :default => false
  	 add_column :red_lights, :question_3, :boolean, :default => false
  	 add_column :red_lights, :question_4, :boolean, :default => false
  	 add_column :red_lights, :question_5, :boolean, :default => false
  	 add_column :red_lights, :question_6, :boolean, :default => false
  	 add_column :red_lights, :question_7, :boolean, :default => false
  	 add_column :red_lights, :question_8, :boolean, :default => false
  	 add_column :red_lights, :question_9, :boolean, :default => false
  	 add_column :red_lights, :question_10, :boolean, :default => false
  	 add_column :red_lights, :question_11, :boolean, :default => false
  	 add_column :red_lights, :question_12, :boolean, :default => false
  	 add_column :red_lights, :question_13, :boolean, :default => false
  	 add_column :red_lights, :question_14, :boolean, :default => false
  	 add_column :red_lights, :question_15, :boolean, :default => false
  	 add_column :red_lights, :question_16, :boolean, :default => false
  	 add_column :red_lights, :question_17, :boolean, :default => false
  	 add_column :red_lights, :question_18, :boolean, :default => false
  	 add_column :red_lights, :question_19, :boolean, :default => false
  	 add_column :red_lights, :question_20, :boolean, :default => false
  end
end
