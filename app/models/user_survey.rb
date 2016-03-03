class UserSurvey < ActiveRecord::Base
  has_many :user_answers, dependent: :destroy
  has_one :aggressor
  has_one :victim

  accepts_nested_attributes_for :aggressor
  accepts_nested_attributes_for :victim
end
