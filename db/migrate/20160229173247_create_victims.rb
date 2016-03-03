class CreateVictims < ActiveRecord::Migration
  def change
    create_table :victims do |t|
      t.string :name
      t.text :description
      t.references :user_survey, index: true

      t.timestamps null: false
    end
  end
end
