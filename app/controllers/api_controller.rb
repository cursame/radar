class ApiController < ApplicationController
  def documentation_methods
  end

  def register_by_api
    
  end

  def create_user_for_api(name, email, charge, password, terms_of_service)
  end

  def create_institution_and_user(name, url, user_id)
  end

  def acces_to_red_lights
  	#http://localhost:3000/api/acces_to_red_lights?email=alfredo@cursa.me&&token=7938c619b2f85202
  	red_lights = []
  	@user = User.find_by_email(params[:email])
  	@institution = Institution.find_by_tokenspecialviews_and_user_id(params[:token], @user.id)
    @red_lights = @institution.red_lights
    if @red_lights.count == 0
    	    red_lights.push("No tienes ningún tipo de notificación disponible actualmente") 
        else   
            @red_lights.each do |r|
            	@preguntas = interptreter_quest(r.type_denunce, r)
	            	red_lights.push(
		            		mail: r.mail,
		            		name: r.name,
		            		codigo: r.institution_code,
		            		tipos_de_violencia: r.types_of_violence,
		            		preguntas: @preguntas.to_json,
		            		historia: r.history,
		            		agresores: r.aggressors
	            	)
            end
    end

    render :json => red_lights.to_json
  end

end
