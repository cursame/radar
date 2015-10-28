class AddInstitutionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :institution_id, :integer, null: false
    add_index :users, :institution_id
  end
end
