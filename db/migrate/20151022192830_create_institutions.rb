class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :title,      null: false
      t.string :subdomain,  null: false

      t.timestamps null: false
    end
  end
end
