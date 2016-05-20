class Victim < ActiveRecord::Base
  validates_presence_of :name
  validates :group, presence: true

  belongs_to :user_survey
  belongs_to :group
end
