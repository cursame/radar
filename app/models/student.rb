class Student < ActiveRecord::Base
  validates_presence_of :name
  validates :institution, presence: true

  scope :institution_id, -> institution_id { where(institution_id: institution_id) }

  belongs_to :institution
end
