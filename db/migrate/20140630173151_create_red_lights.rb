class CreateRedLights < ActiveRecord::Migration
  def change
    create_table :red_lights do |t|
      t.string :mail
      t.string :name
      t.string :institution_code
      t.string :type_denunce
      t.boolean :cuestion_1
      t.boolean :cuestion_2
      t.boolean :cuestion_3
      t.boolean :cuestion_4
      t.boolean :cuestion_5
      t.boolean :cuestion_6
      t.boolean :cuestion_7
      t.boolean :cuestion_8
      t.boolean :cuestion_9
      t.boolean :cuestion_10
      t.boolean :cuestion_11
      t.boolean :cuestion_12
      t.boolean :cuestion_13
      t.boolean :cuestion_14
      t.boolean :cuestion_15
      t.boolean :cuestion_16
      t.boolean :cuestion_17
      t.boolean :cuestion_18
      t.boolean :cuestion_19
      t.boolean :cuestion_20


      t.timestamps
    end
  end
end
