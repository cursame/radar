class CreateCuestionaries < ActiveRecord::Migration
  def change
    create_table :cuestionaries do |t|
      t.string :title
      t.string :call_code
      t.text :instructions

      t.timestamps
    end
  end
end
