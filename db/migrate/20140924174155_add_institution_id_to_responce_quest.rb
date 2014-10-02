class AddInstitutionIdToResponceQuest < ActiveRecord::Migration
  def change
    add_column :responce_quests, :institution_id, :integer
  end
end
