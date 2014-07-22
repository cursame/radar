class UsersController < ApplicationController
  before_filter :session_filter, :only => [:show]
  before_filter :confirmation, :only => [:show]
  def new
      @user = User.new
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
    if @user.id == current_user.id
      puts "ususario permitido"
    else
      redirect_to user_path(@user)

    end
  end

	######## session metodods ############

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



	############ define user params #############
	def user_params
    	 params.require(:user).permit(:name, :email, :charge, :password, :password_confirmation, :terms_of_service, institutions_attributes: [:name, :url, :phone, :extencion])
  end



private
  #######@@@@@@ encripted password validations @@@@@###########

  def session_filter
   if session[:user] == nil
      redirect_to root_path
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
      sha256 = Digest::SHA256.new
      digest = sha256.update password
      backend_validate = user.w_digest(digest)
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

end
