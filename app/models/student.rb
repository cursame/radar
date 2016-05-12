class Student < ActiveRecord::Base
  validates_presence_of :name
  validates :institution, presence: true

  belongs_to :institution
end
