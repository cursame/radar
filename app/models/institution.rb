class Institution < ActiveRecord::Base
  has_many :users
  has_many :user_surveys
end
