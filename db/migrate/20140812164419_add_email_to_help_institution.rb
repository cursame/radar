class AddEmailToHelpInstitution < ActiveRecord::Migration
  def change
    add_column :help_institutions, :email, :string
  end
end
