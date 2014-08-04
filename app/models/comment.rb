class Comment < ActiveRecord::Base
	belongs_to :red_light
	belongs_to :user
end
