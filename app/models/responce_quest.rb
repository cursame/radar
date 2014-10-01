class ResponceQuest < ActiveRecord::Base
	belongs_to :cuestionary
	belongs_to :institution
end
