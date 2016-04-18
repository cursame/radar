class AddViolenceTypeIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :violence_type_id, :integer
    add_index :questions, :violence_type_id
  end
end
