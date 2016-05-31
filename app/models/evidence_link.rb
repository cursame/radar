class EvidenceLink < ActiveRecord::Base
  validates_presence_of :url
  validates_format_of :url, with: URI::regexp(%w(http https))

  belongs_to :user_survey
end
