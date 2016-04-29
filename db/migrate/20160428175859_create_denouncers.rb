class CreateDenouncers < ActiveRecord::Migration
  def change
    create_table :denouncers do |t|
      t.string :email,  default: "",  null: false
      t.integer :gender, default: 2,  null: false, index: true
      t.string :name
      t.string :phone_number
      t.references :user_survey, index: true, null: false

      t.timestamps null: false
    end
  end
end
