class Comment < ActiveRecord::Base
	belongs_to :red_light
	belongs_to :user

	validates_presence_of :content
	validates_presence_of :red_light
	validates_presence_of :user
    
end
