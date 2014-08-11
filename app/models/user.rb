class User < ActiveRecord::Base
	 has_many :institutions
     has_many :comments
     
     ####### validates ###############
     validates_presence_of :password
     validates_confirmation_of :password, on: :create
     validates_length_of :password, minimum: 8
     validates_inclusion_of :terms_of_service, :in => [true], message: 'must be true'
     validates_presence_of :email
     validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
     validates_uniqueness_of :email
     validates_presence_of :name
     #validates_presence_of :institutions


     ######### atributes to nested ###############

     accepts_nested_attributes_for :institutions, allow_destroy: true

     ####### codification ##########
    def encripted_codification
    Digest::SHA2.hexdigest( self.salt + self.password.to_s + secure_key ) 
    end

    def secure_key
       "supercalifragilisticoespriralidoso35903randomicenoesconfortable92051siempre0419dma40910492damasco"
    end 

    def w_digest(passtd)
     cript = Digest::SHA2.hexdigest( self.salt + passtd.to_s + secure_key )
     compare_acces(cript, encripted_codification )
    end

    def compare_acces(cript, decript)
        if cript ==  decript
          true
          else
           false
        end
    end
end
