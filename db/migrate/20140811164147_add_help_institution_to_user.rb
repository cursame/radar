class AddHelpInstitutionToUser < ActiveRecord::Migration
  def change
    add_column :users, :help_institution_id, :integer
  end
end
