class RemoveColumnPhoneForInstitution < ActiveRecord::Migration
  def change
  	remove_column :institutions, :phone
  	remove_column :institutions, :extencion
  end
end
