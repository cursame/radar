class AddQuestionRequiresToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :question_requires, :text
  end
end
