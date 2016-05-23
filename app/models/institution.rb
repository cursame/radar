class Institution < ActiveRecord::Base
  validates :subdomain, presence: true, uniqueness: true
  validates_format_of :subdomain, with: /\A^[a-z\d]+(-[a-z\d]+)*$\Z/
  validates :title, presence: true

  has_many :users
  has_many :user_surveys
  has_many :grades, dependent: :destroy
  has_many :students, dependent: :destroy

  accepts_nested_attributes_for :grades
end
