class RedLight < ActiveRecord::Base

	def operator
		array_detection = []
		case self.type_denunce
		 when 'personal'
		 	 array_detection.push(self.cuestion_1, self.cuestion_2, self.cuestion_3, self.cuestion_4, self.cuestion_5, self.cuestion_6,  self.cuestion_7,  self.cuestion_8, self.cuestion_9, self.cuestion_10, self.cuestion_11, self.cuestion_12, self.cuestion_13, self.cuestion_14, self.cuestion_15, self.cuestion_16, self.cuestion_17, self.cuestion_18, self.cuestion_19) 
		 when 'non personal'
		 	 array_detection.push(self.cuestion_1, self.cuestion_2, self.cuestion_3, self.cuestion_4, self.cuestion_5, self.cuestion_6,  self.cuestion_7,  self.cuestion_8, self.cuestion_9, self.cuestion_10, self.cuestion_11, self.cuestion_12)
		end 	
		array_detection
		counts = Hash.new(0)
		array_detection.each { |name| counts[name] += 1 }
		acert = counts[true].to_f
        total = (array_detection.count).to_f
        diference = (acert/total)*100

        if (1..20).include?(diference) == true
        	@v = "Peligrosidad Baja"
        end

        if (21..49).include?(diference) == true
        	@v = "Peligrosidad Media"
        end
        if (50..100).include?(diference) == true
        	@v = "Peligrosidad Alta"
        end
        @v
	end


	def types_of_violence
      validates_violence_types = []
     case self.type_denunce
      when 'personal'
	      if self.cuestion_1 == true && self.cuestion_2 == true
	      	validates_violence_types.push('Físico')
	      end
	      if self.cuestion_3 == true && self.cuestion_4 == true
	      	validates_violence_types.push('Amenaza')
	      end
	      if (self.cuestion_5 == true && self.cuestion_6 == true) || (self.cuestion_6 == true && self.cuestion_7 == true) || (self.cuestion_5 == true && self.cuestion_7 == true)
	      	validates_violence_types.push('Exclusión')
	      end
	      if self.cuestion_8 == true && self.cuestion_9 == true
	      	validates_violence_types.push('Indefensión')
	      end
	      if self.cuestion_10 == true && self.cuestion_11 == true
	      	validates_violence_types.push('Malestar escolar')
	      end
	      if self.cuestion_12 == true && self.cuestion_13 == true
	      	validates_violence_types.push('Violencia verbal')
	      end
	      if self.cuestion_14 == true && self.cuestion_15 == true
	      	validates_violence_types.push('Burla')
	      end
	      if self.cuestion_16 == true && self.cuestion_17 == true
	      	validates_violence_types.push('Cyber bullying')
	      end
	      if self.cuestion_18 == true && self.cuestion_19 == true
	      	validates_violence_types.push('Daño a pertenencias')
	      end
	   when 'non personal'
	   	 if self.cuestion_1 == true && self.cuestion_2 == true
	      	validates_violence_types.push('Físico')
	      end
	      if self.cuestion_3 == true && self.cuestion_4 == true
	      	validates_violence_types.push('Amenaza')
	      end
	      if self.cuestion_5 == true && self.cuestion_6 == true
	      	validates_violence_types.push('Exclusión')
	      end
	      if self.cuestion_8 == true && self.cuestion_9 == true
	      	validates_violence_types.push('Indefensión / Malestar escolar')
	      end
	      if self.cuestion_10 == true && self.cuestion_11 == true
	      	validates_violence_types.push('Violencia verbal / Burla ')
	      end
	      if self.cuestion_12 == true && self.cuestion_13 == true
	      	validates_violence_types.push('Cyber Bullying')
	      end
	  end
      validates_violence_types
	end
end
