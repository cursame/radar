class Institution < ActiveRecord::Base
  has_many :users
  has_many :user_surveys
  has_many :grades, dependent: :destroy
end
