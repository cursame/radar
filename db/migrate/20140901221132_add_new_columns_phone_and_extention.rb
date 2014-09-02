class AddNewColumnsPhoneAndExtention < ActiveRecord::Migration
  def change
  	add_column :institutions, :phone, :decimal
    add_column :institutions, :extencion, :decimal
  end
end
