class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :text
      t.string :type_violence
      t.references :survey, index: true

      t.timestamps null: false
    end
  end
end
