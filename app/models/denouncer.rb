class Denouncer < ActiveRecord::Base
  validates_presence_of :email
  validates :group, presence: true

  enum gender: { male: 0, female: 1, prefer_not_to_disclose: 2 }

  belongs_to :user_survey
  belongs_to :group
end
