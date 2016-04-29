class Grade < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :institution
  validates_associated :institution
end
