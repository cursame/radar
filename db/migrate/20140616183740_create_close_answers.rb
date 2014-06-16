class CreateCloseAnswers < ActiveRecord::Migration
  def change
    create_table :close_answers do |t|
      t.string :value
      t.boolean :checked
      t.integer :question_id
      t.timestamps
    end
  end
end
