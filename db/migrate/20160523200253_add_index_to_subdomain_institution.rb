class AddIndexToSubdomainInstitution < ActiveRecord::Migration
  def change
    add_index :institutions, :subdomain, unique: true
  end
end
