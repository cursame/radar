class AddAcceptedTermsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :accepted_terms, :boolean, default: false, null: false
  end
end
