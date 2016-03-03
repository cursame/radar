class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.text :description
      t.string :type_survey

      t.timestamps null: false
    end
  end
end
