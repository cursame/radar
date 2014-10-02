class Question < ActiveRecord::Base
	belongs_to :questionary
	has_many :open_answer
	has_many :close_answer

    accepts_nested_attributes_for :open_answer, allow_destroy: true
    accepts_nested_attributes_for :close_answer, allow_destroy: true



end
