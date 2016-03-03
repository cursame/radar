class UserAnswer < ActiveRecord::Base
  belongs_to :user_survey
  belongs_to :question
end
