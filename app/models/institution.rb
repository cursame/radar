class Institution < ActiveRecord::Base
  has_many :users
  has_many :user_surveys
  has_many :grades, dependent: :destroy
  has_many :students, dependent: :destroy

  accepts_nested_attributes_for :grades
end
