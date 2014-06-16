class CreateOpenAnswers < ActiveRecord::Migration
  def change
    create_table :open_answers do |t|
      t.text :value
      t.integer :question_id

      t.timestamps
    end
  end
end
