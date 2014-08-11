class RedLight < ActiveRecord::Base
    has_many :comments

	def help_institution
		@i = Institution.where(:tokenspecialforms => self.institution_code)
		@i
	end

	def operator
		array_detection = []
		case self.type_denunce
		 when 'personal'
		 	 array_detection.push(self.question_1, self.question_2, self.question_3, self.question_4, self.question_5, self.question_6,  self.question_7,  self.question_8, self.question_9, self.question_10, self.question_11, self.question_12, self.question_13, self.question_14, self.question_15, self.question_16, self.question_17, self.question_18, self.question_19) 
		 when 'non personal'
		 	 array_detection.push(self.question_1, self.question_2, self.question_3, self.question_4, self.question_5, self.question_6,  self.question_7,  self.question_8, self.question_9, self.question_10, self.question_11, self.question_12)
		end 	
		array_detection
		counts = Hash.new(0)
		array_detection.each { |name| counts[name] += 1 }
		acert = counts[true].to_f
        total = (array_detection.count).to_f
        diference = (acert/total)*100

        if (1..20).include?(diference) == true
        	@v = "Peligrosidad Moderada"
        end

        if (21..49).include?(diference) == true
        	@v = "Peligrosidad Media"
        end
        if (50..100).include?(diference) == true
        	@v = "Peligrosidad Grave"
        end
        @v
	end

	def types_of_violence
      validates_violence_types = []
     case self.type_denunce
      when 'personal'
	      if self.question_1 == true && self.question_2 == true
	      	validates_violence_types.push('Físico')
	      end
	      if self.question_3 == true && self.question_4 == true
	      	validates_violence_types.push('Amenaza')
	      end
	      if (self.question_5 == true && self.question_6 == true) || (self.question_6 == true && self.question_7 == true) || (self.question_5 == true && self.question_7 == true)
	      	validates_violence_types.push('Exclusión')
	      end
	      if self.question_8 == true && self.question_9 == true
	      	validates_violence_types.push('Indefensión')
	      end
	      if self.question_10 == true && self.question_11 == true
	      	validates_violence_types.push('Malestar escolar')
	      end
	      if self.question_12 == true && self.question_13 == true
	      	validates_violence_types.push('Violencia verbal')
	      end
	      if self.question_14 == true && self.question_15 == true
	      	validates_violence_types.push('Burla')
	      end
	      if self.question_16 == true && self.question_17 == true
	      	validates_violence_types.push('Cyber bullying')
	      end
	      if self.question_18 == true && self.question_19 == true
	      	validates_violence_types.push('Daño a pertenencias')
	      end
	   when 'non personal'
	   	 if self.question_1 == true && self.question_2 == true
	      	validates_violence_types.push('Físico')
	      end
	      if self.question_3 == true && self.question_4 == true
	      	validates_violence_types.push('Amenaza')
	      end
	      if self.question_5 == true && self.question_6 == true
	      	validates_violence_types.push('Exclusión')
	      end
	      if self.question_8 == true && self.question_9 == true
	      	validates_violence_types.push('Indefensión / Malestar escolar')
	      end
	      if self.question_10 == true && self.question_11 == true
	      	validates_violence_types.push('Violencia verbal / Burla ')
	      end
	      if self.question_12 == true && self.question_13 == true
	      	validates_violence_types.push('Cyber Bullying')
	      end
	  end
      validates_violence_types
	end
end
