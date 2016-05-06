class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title,     null: false
      t.references :grade, null: false, index: true

      t.timestamps null: false
    end
  end
end
