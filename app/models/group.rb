class Group < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :grade
  validates_associated :grade
end