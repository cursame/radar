class CreateWitnesses < ActiveRecord::Migration
  def change
    create_table :witnesses do |t|
      t.string :name
      t.references :group,        index: true, foreign_key: true
      t.references :user_survey,  index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
