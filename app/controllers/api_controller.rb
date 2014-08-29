class ApiController < ApplicationController
  def documentation_methods
  end
  
  ############################### REGISTRO DE USUARIO ######################
  def register_by_api
    # http://localhost:3000/api/register_by_api?
    user = User.find_by_email(params[:email])
    if user == nil
      user = create_user_for_api(params[:name], params[:email], params[:charge], params[:password], params[:password] , params[:terms_of_service], params[:confirmation], params[:insitution], params[:url])
    else
      user = 'The user already exists (there is a registered user with this email)'
    end
   render :json => user.to_json
  end
  ############################# CREACION DEL USUARIO POR API ######################
  def create_user_for_api(name, email, charge, password, password_confirmation,  terms_of_service, confirmation)
    @u = User.create(name: name, email: email, charge: charge, password: password, password_confirmation: password_confirmation, confirmation: confirmation, terms_of_service: terms_of_service)
    @url = create_institution_and_user(name, url, @u.id)
    createdu = @u + @url 
  end
  ############################# CREACION DE INSTITUCION POR API ###################
  def create_institution_and_user(name, url, user_id)
    @intitution = Institution.create(name: name, url: url, user_id: user.id)
  end
  def requests_by_token 

  end
  ############################ ACCESO A LAS ALERTAS POR API #######################
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
