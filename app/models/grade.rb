class Grade < ActiveRecord::Base
  validates_presence_of :title

  has_many :groups, dependent: :destroy

  belongs_to :institution
  validates_associated :institution

  accepts_nested_attributes_for :groups
end
