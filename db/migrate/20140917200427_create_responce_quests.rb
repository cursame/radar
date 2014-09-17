class CreateResponceQuests < ActiveRecord::Migration
  def change
    create_table :responce_quests do |t|
      t.string :code_responce
      t.integer :cuestionary_id
      t.integer :opt
      t.text :responce

      t.timestamps
    end
  end
end
