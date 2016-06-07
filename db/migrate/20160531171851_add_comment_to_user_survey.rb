class AddCommentToUserSurvey < ActiveRecord::Migration
  def change
    add_column :user_surveys, :comment, :text
  end
end
