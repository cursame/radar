class RemoveTypeViolenceFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :type_violence, :string
  end
end
