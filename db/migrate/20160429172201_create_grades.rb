class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :title,           null: false
      t.references :institution, null: false, index: true

      t.timestamps null: false
    end
  end
end
