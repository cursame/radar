class AddPhoneAndExtencionToInstitution < ActiveRecord::Migration
  def change
    add_column :institutions, :phone, :integer
    add_column :institutions, :extencion, :integer
  end
end
