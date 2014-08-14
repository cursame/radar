class UsersController < ApplicationController
  before_filter :session_filter, :only => [:show, :configurate, :edit, :adviser_profile, :expert]
  before_filter :adviser_filter, :only => [:show, :configurate, :edit]
  before_filter :confirmation, :only => [:show]
  def new
      @user = User.new
  end

  def update
      @user = current_user
      @user_edit = @user.update_attributes(user_params)
      flash[:notice] = 'Se ha actualizado el usuario'
      redirect_to :back
  end

  def edit
    @user = current_user
    institutions = @user.institutions.build
  end

  def register
      @user = User.new
      @institution = Institution.new
      institutions = @user.institutions.build
  end

	def create
	  @user = User.create(user_params)

    if @user.save
      digest = Digest::SHA2.hexdigest(@user.password)
      @user.password = digest
      @user.salt = rand(235..1234)
      @user.save
      @mailer = InstitutionManagment.create_notification(@user).deliver
    end

    redirect_to :back
	end

  def login
  end

  def show
    @user = User.find(params[:id])
    @ui = @user.institutions.first
    flash[:notice] = nil
    if @user.id == current_user.id
      puts "ususario permitido"
    else
      redirect_to user_path(@user)
    end
  end
  
  ######### adviser methods #######

  def adviser_profile
    @user = current_user
    @red_lights = RedLight.where(adviser: @user.adviser_code).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    if @user.adviser == false 
      redirect_to root_path
    end
  end

  def expert
    @user = current_user
  end

	######## session metods ############

	def session_create
		@user = User.find_by_email(params[:email])
    if @user != nil
		password_cript(params[:password], @user)
       else
        flash[:notice] = 'Usuario no existente pruebe de nuevo'
        redirect_to :back
    end
	end

   ######## session destroy ##########


	def session_exit
		session[:user] = nil
		redirect_to root_path
	end
  

  def accept_in_radar
    @user = User.find(params[:id])
    @user.update_attributes({confirmation: true, confirmed_by: current_user.id})
    redirect_to :back
  end
  
  def configurate
    @user = current_user
  end
  


	############ define user params #############
	def user_params
    	 params.require(:user).permit(:name, :email, :charge, :password, :password_confirmation, :terms_of_service, institutions_attributes: [:name, :url, :phone, :extencion])
  end
  ########### methods to reconfirm password ########

    #### vista de acceso para cambio de contrasena ####
    def mail_to_reconfirm_password
    end
    #### metodo de cambio email #####
    def deliver_resset_pass_instructions
      @user = User.find_by_email(params[:email])
      if @user != nil
        if @user.confirmation == true
         @link = "#{action_host}/view_change_pass?id=#{@user.id}&&token=#{@user.salt}"
         @email = InstitutionManagment.reset_password(@user, @link).deliver
         flash[:notice] = 'Se han mandado las instrucciones a tu email'
         redirect_to root_path
        else
         flash[:notice] = 'Aún no has sido confirmado ponte en contacto con nosotros para que te confirmemos'
         redirect_to root_path
        end
       else
         flash[:notice] = 'Tu usuario no existe puede que te equivocaras de email vuelve a intentarlo'
         redirect_to :back
      end
    end

    #### vista para cambio de password ####
    def view_change_pass
      session[:user] = nil
      @user = User.find_by_id_and_salt(params[:id], params[:token])
      if @user != nil
      session[:user_to_change_password] = @user.id
      else
        flash[:notice] = 'El link del usuario al que esta intentando ingresar no existe'
        redirect_to root_path
      end
    end
    ##### meto para cambiar contrasena #####
    def change_password
      @user = User.find(session[:user_to_change_password]) 
      if params[:password] == params[:password_confirmation] && params[:password] != nil
        passw = digest(params[:password]).to_s
        @user.password = passw
        @user.salt = rand(235..1234)
        @user.save
        if @user.save
          @email = InstitutionManagment.notificate_password_change(@user).deliver
          flash[:notice] = 'Contraseña cambiada correctamente'
          session[:user] = @user.id 
          session[:user_to_change_password] = nil
          redirect_to root_path
        else
          flash[:notice] = 'Por alguna razón el cambio de contraseña no se pudo realizar intentelo mas tarde'
          redirect_to root_path
        end
      else
        flash[:notice] = 'Las contraseñas no coinciden vuelva a intentarolo'
        redirect_to :back
      end

    end


private
  #######@@@@@@ encripted password validations @@@@@###########

  def session_filter
   if session[:user] == nil
      redirect_to root_path
   end
  end

  def adviser_filter
    if current_user.adviser
      redirect_to adviser_profile_path
    end
  end
  
  def confirmation
    @user = User.find(session[:user])
     if @user.confirmation 
         flash[:notice] = 'Bienbenido a radar' 
       else
         flash[:notice] = 'No has sido confirmado como miembro espera la llamada de alguno denuestro ejecutivos' 
         session[:user] = nil
         redirect_to root_path
     end
  end

protected
  ############## protected methods ###################
  def password_cript(password, user)
      passw = digest(password).to_s
      backend_validate = user.w_digest(passw)
      puts "#{backend_validate}"

      if  backend_validate == true
      	session[:user] = "#{user.id}"
      	redirect_to user_path(user.id)
        else
        	session[:user] = nil
        	redirect_to :back
      end
      puts "#{session[:user]}"
   end

   def digest(param_to_digest)
      sha256 = Digest::SHA256.new
      @digest = sha256.update param_to_digest.to_s
   end

end
