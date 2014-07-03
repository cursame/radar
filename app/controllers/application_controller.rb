class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   helper_method :interptreter_quest

   ############# intepreta los cuestionarios de foco rojo #############
   def interptreter_quest(type_f, id)
     @red_ligth = RedLight.find(id)
     puts "#{@red_ligth}"
     acts = []
   	 case type_f
 	  	 when 'personal'            
 	  	 	if @red_ligth.cuestion_1
 	          acts.push('Me han golpeado con la intención de lastimarme en el último mes en la escuela ')
 	  	    end
 	  	 	if @red_ligth.cuestion_2
 	          acts.push('Me han amenazado con hacerme daño o lastimarme ')
 	  	    end
 	  	 	if @red_ligth.cuestion_3
 	          acts.push('Han inventado rumores parea hacerme sentir mal a propósito')
 	  	    end
 	  	 	if @red_ligth.cuestion_4
 	          acts.push('Siento que muy seguido me han dañado o lastimado de alguna manera con la intensión de hacerme sentir mal ')
 	  	    end
 	  	 	if @red_ligth.cuestion_5
 	          acts.push('Siento que no me puedo defender de esta persona o estas personas ')
 	  	    end
 	  	    if @red_ligth.cuestion_6
 	          acts.push('Estoy asustado , triste y me siento indefenso ante lo que me hacen ')
 	  	    end
 	  	    if @red_ligth.cuestion_7
 	          acts.push('Han dañado mi material, mis útiles etc... con la intención de hacerme sentir mal y afectarme ')
 	  	    end
 	  	    if @red_ligth.cuestion_8
 	  	       acts.push('Me han dicho cosas que me hieren, humillan, lastiman y no sé cómo detenerlo ')
 	  	    end
 	  	    if @red_ligth.cuestion_9
 	          acts.push('Siento que no quiero ir a la escuela para evitar sentirme mal a causa de algún compañero (a) ')
 	  	    end
 	  	    if @red_ligth.cuestion_10
 	          acts.push('He inventado pretextos para no ir a la escuela para evitar que me molesten ')
 	  	    end
 	  	    if @red_ligth.cuestion_11
 	          acts.push('Se han burlado de mi persona, de lo que digo, de lo que pienso y lo han hecho a propósito con la intención de dañarme  ')
 	  	    end
 	  	    if @red_ligth.cuestion_12
 	          acts.push('Han subido algún video de mi en alguna situación vergonzosa que me hace sentir mal , apenado, avergonzado ')
 	  	    end
 	  	    if @red_ligth.cuestion_13
 	          acts.push('Me han amenazado o me han faltado el respeto a través de mensajes por celular o por alguna red social con la intención de afectarme y hacerme sentir mal ')
 	  	    end
 	  	    if @red_ligth.cuestion_14
 	          acts.push('No me han dejado participar en alguna actividad, me ignoran, hacen como que no existo para dañarme de alguna manera ')
 	  	    end
 	  	 when 'non personal'
 	  	 	if @red_ligth.cuestion_1
 	          acts.push('He visto como golpean a algún compañero(a) con la intención de lastimarlo y esto sucede muy a menudo ')
 	  	    end
 	  	 	if @red_ligth.cuestion_2
 	          acts.push('Sé que mi compañero(a) ha sido amenazado con que le van a hacer daño o lastimar ')
 	  	    end
 	  	 	if @red_ligth.cuestion_3
 	          acts.push('Han inventado rumores para hacerlo(a) sentir mal a propósito')
 	  	    end
 	  	 	if @red_ligth.cuestion_4
 	          acts.push('Siento que muy seguido dañan o lastiman de alguna manera a esta persona con la intensión de hacerlo sentir mal y mi compañero(a) no se defiende ')
 	  	    end
 	  	 	if @red_ligth.cuestion_5
 	          acts.push('Siento que no puedo defender a mi compañero(a) de estas personas por que me da miedo que después me lo hagan a mi ')
 	  	    end
 	  	    if @red_ligth.cuestion_6
 	          acts.push('Estoy asustado , triste y enojado ante lo que veo que le hacen a mi compañero(a) ')
 	  	    end
 	  	    if @red_ligth.cuestion_7
 	          acts.push('Han dañado su material, sus útiles etc... con la intención de hacerlo(a) sentir mal y afectarlo')
 	  	    end
 	  	    if @red_ligth.cuestion_8
 	  	       acts.push('He escuchado que le dicen cosas que hieren, humillan, lastiman y no sé cómo detenerlo')
 	  	    end
 	  	    if @red_ligth.cuestion_9
 	          acts.push('Siento que no quiero ir a la escuela para evitar sentirme mal a causa de algún compañero (a) ')
 	  	    end
 	  	    if @red_ligth.cuestion_10
 	          acts.push('Se han burlado de esta persona, de lo que dice, de lo que piensa y lo han hecho a propósito con la intención de dañar  ')
 	  	    end
 	  	    if @red_ligth.cuestion_11
 	          acts.push('Han subido algún video de mi compañero(a) en alguna situación vergonzosa que lo hace sentir mal , apenad(a), avergonzado(a)  ')
 	  	    end
 	  	    if @red_ligth.cuestion_12
 	          acts.push('He sabido que le han amenazado o le han faltado el respeto a través de mensajes por celular o por alguna red social con la intención de afectarlo(a) y hacerlo(a) sentir mal ')
 	  	    end
 	  	    if @red_ligth.cuestion_13
 	          acts.push('He visto que no lo han dejado participar en alguna actividad, lo ignoran, hacen como que no existe para dañarlo(a) de alguna manera ')
 	  	    end
   	 end

   	      @acts = acts

   end
  
end
