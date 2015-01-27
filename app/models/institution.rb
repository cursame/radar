class Institution < ActiveRecord::Base
	belongs_to :user, dependent: :destroy
    has_many :responce_quests
	validates_presence_of :name
	validates_presence_of :url
	validates_presence_of :phone

	after_create do 
		self.tokenspecialforms = SecureRandom.hex(8)
		self.tokenspecialviews = SecureRandom.hex(8)
		self.save
	end

	after_destroy do
		puts "**************************** eliminando alertas rojas *************************"
		@red_lights = RedLight.destroy_all(:institution_code => self.tokenspecialforms)
	end

	def red_lights
		@red_lights = RedLight.where(:institution_code => self.tokenspecialforms)
	end

end
