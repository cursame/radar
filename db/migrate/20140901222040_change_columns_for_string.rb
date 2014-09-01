class ChangeColumnsForString < ActiveRecord::Migration
  def change
  	remove_column :institutions, :phone
  	remove_column :institutions, :extencion
    add_column :institutions, :phone, :string
    add_column :institutions, :extencion, :string
  end
end
