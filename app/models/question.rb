class Question < ActiveRecord::Base
  belongs_to :survey
  belongs_to :violence_type

  has_many :user_answers
end
