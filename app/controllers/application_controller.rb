class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   helper_method :interptreter_quest
   helper_method :current_user
   helper_method :index_by_institution_violence

   def current_user
    @user = User.find(session[:user])
   end

   def action_host
   end


   ############# intepreta los cuestionarios de foco rojo #############
   def interptreter_quest(type_f, id)
     @red_ligth = RedLight.find(id)
     puts "#{@red_ligth}"
     acts = []
   	 case type_f
 	  	 when 'personal'            
 	  	 	if @red_ligth.question_1
 	          acts.push('Me  han golpeado con la intención de lastimarme en el último mes en la escuela')
 	  	    end
 	  	 	if @red_ligth.question_2
 	          acts.push('Me han dañado  o lastimado el cuerpo de alguna manera ')
 	  	    end
 	  	 	if @red_ligth.question_3
 	          acts.push('Me han amenazado con hacerme algo que me puede dañar')
 	  	    end
 	  	 	if @red_ligth.question_4
 	          acts.push('Me han amenazado con hacerme daño o lastimarme si digo algo de lo que me hacen ')
 	  	    end
 	  	 	if @red_ligth.question_5
 	          acts.push('Han inventado rumores para hacerme sentir mal a propósito y para que los demás no me hablen')
 	  	    end
 	  	    if @red_ligth.question_6
 	          acts.push('No me han dejado participar en alguna actividad para hacerme sentir mal')
 	  	    end
 	  	    if @red_ligth.question_7
 	          acts.push('Me ignoran, hacen como que no existo para dañarme de alguna manera ')
 	  	    end
 	  	    if @red_ligth.question_8
 	  	       acts.push('Siento que no me puedo defender de esta persona o estas personas ')
 	  	    end
 	  	    if @red_ligth.question_9
 	          acts.push('Estoy asustado , triste y me siento indefenso ante lo que me hacen ')
 	  	    end
 	  	    if @red_ligth.question_10
 	          acts.push('Siento que no quiero ir a la escuela para evitar sentirme mal a causa de algún compañero (a)')
 	  	    end
 	  	    if @red_ligth.question_11
 	          acts.push('He inventado pretextos para no ir a la escuela para evitar que me molesten ')
 	  	    end
 	  	    if @red_ligth.question_12
 	          acts.push('Me han dicho cosas que me hieren, humillan, lastiman y no sé cómo detenerlo ')
 	  	    end
 	  	    if @red_ligth.question_13
 	          acts.push('Me dicen un apodo o groserías que me lastiman ')
 	  	    end
 	  	    if @red_ligth.question_14
 	          acts.push('Se han burlado de mi persona, o de mis gustos, o de mi forma de vestir y lo han hecho a propósito con la intención de dañarme ')
 	  	    end
          if @red_ligth.question_15
           acts.push('Se ríen cuando hablo o participo en clase con la intención de que me sienta mal')
          end
          if @red_ligth.question_16
           acts.push('Me han faltado el respeto a través de mensajes por celular o por alguna red social con la intención de afectarme y hacerme sentir mal ')
          end
          if @red_ligth.question_17
           acts.push('Han subido algún video de mi en alguna situación vergonzosa que me hace sentir mal , apenado, avergonzado')
          end
          if @red_ligth.question_18
           acts.push('Me han escondido material de clase, cuadernos, mochila para molestarme')
          end
          if @red_ligth.question_19
           acts.push('Han dañado mi material,  mis útiles etc... con la intención de hacerme sentir mal y afectarme ')
          end
 	  	 when 'non personal'
 	  	 	if @red_ligth.question_1
 	          acts.push('He visto como golpean a algún compañero(a) con la intención de lastimarlo y esto sucede muy a menudo ')
 	  	    end
 	  	 	if @red_ligth.question_2
 	          acts.push('Siento que muy seguido dañan o lastiman físicamente a esta persona con la intención  de hacerlo sentir mal y mi compañero(a) no se defiende ')
 	  	    end
 	  	 	if @red_ligth.question_3
 	          acts.push('Sé que mi compañero(a)  ha sido amenazado con que le van a hacer daño o lastimar')
 	  	    end
 	  	 	if @red_ligth.question_4
 	          acts.push('He visto que lo han amenazado si dice a alguien lo que le hacen ')
 	  	    end
 	  	 	if @red_ligth.question_5
 	          acts.push('Han inventado rumores para hacerlo(a) sentir mal a propósito para que los demás lo rechacemos o no le hablemos ')
 	  	    end
 	  	    if @red_ligth.question_6
 	          acts.push('He visto que no lo han dejado participar en alguna actividad, lo ignoran, hacen como que no existe para dañarlo(a)  de alguna manera ')
 	  	    end
 	  	    if @red_ligth.question_7
 	          acts.push('Siento que no puedo defender a mi compañero(a) de estas personas por que me da miedo que después me lo hagan a mi')
 	  	    end
 	  	    if @red_ligth.question_8
 	  	       acts.push('Estoy asustado , triste y enojado ante lo que veo que le hacen a mi compañero (a) y siento que no hay nada que podamos hacer')
 	  	    end
 	  	    if @red_ligth.question_9
 	          acts.push('He escuchado que le dicen  cosas que  hieren, humillan, lastiman')
 	  	    end
 	  	    if @red_ligth.question_10
 	          acts.push(' Se han burlado de esta persona, de lo que dice, de lo que piensa y lo han hecho a propósito con la intención de dañar')
 	  	    end
 	  	    if @red_ligth.question_11
 	          acts.push('Han subido algún video de mi compañero(a)  en alguna situación vergonzosa que lo hace sentir mal , apenado(a), avergonzado(a)')
 	  	    end
 	  	    if @red_ligth.question_12
 	          acts.push('He sabido que le han amenazado o le han faltado el respeto a través de mensajes por celular o por alguna red social con la intención de afectarlo(a) y hacerlo(a) sentir mal ')
 	  	    end
   	 end

   	      @acts = acts

   end


   def index_by_institution_violence(institution)
     refactory = 0
     if institution.red_lights.count != 0
     institution.red_lights.each do |red|
        array_detection = []
        case red.type_denunce
         when 'personal'
           array_detection.push(red.question_1, red.question_2, red.question_3, red.question_4, red.question_5, red.question_6,  red.question_7,  red.question_8, red.question_9, red.question_10, red.question_11, red.question_12, red.question_13, red.question_14, red.question_15, red.question_16, red.question_17, red.question_18, red.question_19) 
         when 'non personal'
           array_detection.push(red.question_1, red.question_2, red.question_3, red.question_4, red.question_5, red.question_6,  red.question_7,  red.question_8, red.question_9, red.question_10, red.question_11, red.question_12)
        end   
        array_detection
        counts = Hash.new(0)
        array_detection.each { |name| counts[name] += 1 }
        acert = counts[true].to_f
        total = (array_detection.count).to_f
        diference = (acert/total)*100
        refactory = refactory + diference
     end
      @refact = refactory / institution.red_lights.count
     else
      @refact = 0
     end
   end


  
end
