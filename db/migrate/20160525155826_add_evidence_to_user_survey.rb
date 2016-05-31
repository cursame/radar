class AddEvidenceToUserSurvey < ActiveRecord::Migration
  def change
    add_column :user_surveys, :evidence, :json
  end
end
