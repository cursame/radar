class Question < ActiveRecord::Base
	belongs_to :questionary
	has_many :open_answer
	has_many :close_answer
end
