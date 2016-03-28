class AddInstitutionIdToUserSurvey < ActiveRecord::Migration
  def change
    add_column :user_surveys, :institution_id, :integer
    add_index :user_surveys, :institution_id
  end
end
