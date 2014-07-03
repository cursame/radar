class Institution < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :name
	validates_presence_of :url
	validates_presence_of :phone

	after_create do 
		self.tokenspecialforms = SecureRandom.hex(8)
		self.tokenspecialviews = SecureRandom.hex(8)
		self.save
	end
end
