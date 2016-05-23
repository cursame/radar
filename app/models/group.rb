class Group < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :grade
  validates_associated :grade

  has_many :denouncers
  has_many :aggressors
  has_many :victims
end
