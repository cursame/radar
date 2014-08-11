class CreateHelpInstitutions < ActiveRecord::Migration
  def change
    create_table :help_institutions do |t|
      t.string :name
      t.integer :identifier
      t.text :addres
      t.integer :phone
      t.integer :ext

      t.timestamps
    end
  end
end
