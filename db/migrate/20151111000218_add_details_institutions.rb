class AddDetailsInstitutions < ActiveRecord::Migration
  def change
    add_column :institutions, :address,         :text,    null: false, default: ''
    add_column :institutions, :state,           :string,  null: false, default: ''
    add_column :institutions, :municipality,    :string,  null: false, default: ''
    add_column :institutions, :phone,           :string,  null: false, default: ''
    add_column :institutions, :cct,             :string,  null: false, default: ''
    add_column :institutions, :education_level, :string,  null: false, default: ''
    add_column :institutions, :category,        :string,  null: false, default: ''
  end
end
