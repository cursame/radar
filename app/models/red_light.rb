class RedLight < ActiveRecord::Base

	def operator
		array_detection = []
		case self.type_denunce
		 when 'personal'
		 	 array_detection.push(self.cuestion_1, self.cuestion_2, self.cuestion_3, self.cuestion_4, self.cuestion_5, self.cuestion_6,  self.cuestion_7,  self.cuestion_8, self.cuestion_9, self.cuestion_10, self.cuestion_11, self.cuestion_12, self.cuestion_13, self.cuestion_14) 
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

        if (21..59).include?(diference) == true
        	@v = "Peligrosidad Media"
        end
        if (60..100).include?(diference) == true
        	@v = "Peligrosidad Alta"
        end
        @v
	end
end
