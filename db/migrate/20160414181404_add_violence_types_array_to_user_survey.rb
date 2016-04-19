class AddViolenceTypesArrayToUserSurvey < ActiveRecord::Migration
  def change
    add_column :user_surveys, :violence_types_array, :string, array: true, default: []
  end
end
