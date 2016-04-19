class CreateViolenceTypes < ActiveRecord::Migration
  def change
    create_table :violence_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
