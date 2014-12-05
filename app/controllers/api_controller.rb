class ApiController < ApplicationController
   skip_before_filter :verify_authenticity_token  

  def documentation_methods
  end
  
  ############################### REGISTRO DE USUARIO ######################
  def register_by_api
    puts "*****************<<<<<ingresando al api>>>>>"
    @user = User.find_by_email(params[:email])
    
    if @user == nil
      @user_a = create_user_for_api(params[:name], params[:email], params[:charge], params[:password].to_s, params[:password].to_s , false, true, params[:institution], params[:url], params[:phone].to_i)
      user_a_responce = {
      name: @user_a.name,
      email: @user_a.email,
      notice: "Usuario creado correctamente"
      }
      @user_a = user_a_responce
    else
      @user_a = 'The user already exists (there is a registered user with this email)'
    end



    render :json => @user_a.to_json

  end


  ############################# CREACION DEL USUARIO POR API ######################
  def create_user_for_api(name, email, charge, password, password_confirmation,  terms_of_service, confirmation, institution, url, phone)
     methods = []
     @u = User.create(name: name, email: email, charge: charge, password: password, password_confirmation: password_confirmation, confirmation: confirmation, terms_of_service: true, salt: rand(235..1234))
     digest = Digest::SHA2.hexdigest(@u.password)
     @u.update_attributes(password: digest)
     methods.push(user: @u)
     @intitution = Institution.create(name: institution, url: url, user_id: @u.id, phone: phone)
     methods.push(institutions: @intitution)
     methods
  end

  ############################# LOGGIN DEL USUARIO POR API ######################

  def session_loggin 
      @user = User.find_by_email(params[:email])
      @password = Digest::SHA2.hexdigest(params[:password].to_s)
      methods = []
      if @user != nil
        if @password  == @user.password
           @user_petition = @user
           session[:user] = @user.id
            @user.institutions.each do |ins|
              methods = {
              email: @user.email,
              institution_name: ins.name,
              institution_url: ins.url,
              tokenspecialforms: ins.tokenspecialforms,
              tokenspecialviews: ins.tokenspecialviews
              }
            end

           @user_petition = methods
        else
           @user_petition = "Su contraseña no es valida"
        end
      else
        @user_petition = "El usuario con el que esta intentando ingresar no existe"
      end 
      render :json => @user_petition.to_json
  end

  ############################ ACCESO A LAS ALERTAS POR API #######################
  def acces_to_red_lights
  	#http://localhost:3000/api/acces_to_red_lights?email=alfredo@cursa.me&&token=7938c619b2f85202
    #http://localhost:3000/api/acces_to_red_lights?email=martin_perez@cursa.me&&token=4a987d697da3050a

    red_lights = []
  	@user = User.find_by_email(params[:email])
    if @user.id == session[:user]
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
      else
      red_lights = "No has iniciado sessión para poder ver tus locales"
    end

    render :json => red_lights.to_json
  end

end
