class User < ActiveRecord::Base
	 has_many :institutions
     
     ####### validates ###############
     validates_presence_of :password
     validates_confirmation_of :password
     validates_length_of :password, minimum: 8
     validates_inclusion_of :terms_of_service, :in => [true], message: 'must be true'
     validates_presence_of :email
     validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
     validates_uniqueness_of :email
     validates_presence_of :name
     validates_presence_of :institutions


     ######### atributes to nested ###############

     accepts_nested_attributes_for :institutions, allow_destroy: true
end
