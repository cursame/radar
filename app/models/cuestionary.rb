class Cuestionary < ActiveRecord::Base

	has_many :questions
	has_many :responce_quests

	accepts_nested_attributes_for :questions, allow_destroy: true
end
