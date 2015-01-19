class AddAddressToInstitution < ActiveRecord::Migration
  def change
    add_column :institutions, :address, :text
    add_column :institutions, :grade_label, :string
  end
end
