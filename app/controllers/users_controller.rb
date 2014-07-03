class UsersController < ApplicationController
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
    redirect_to :back
	end

	######## session metodods ############

	def session_create
		@user = Member.find_by_email(params[:email])
		password_cript(params[:password], @user)
	end

   ######## session destroy ##########


	def session_exit
		session[:member] = nil
		redirect_to root_path
	end




	############ define user params #############
	def user_params
    	 params.require(:user).permit(:name, :email, :charge, :password, :password_confirmation, :terms_of_service, institutions_attributes: [:name, :url, :phone, :extencion])
  end



private
  #######@@@@@@ encripted password validations @@@@@###########
  def password_cript(password, user)
      sha256 = Digest::SHA256.new
      digest = sha256.update password
      backend_validate = user.w_digest(digest)
      puts "#{backend_validate}"

      if  backend_validate == true
      	session[:user] = "#{user.id}"
      	redirect_to member_path(user.id)
        else
        	session[:user] = nil
        	redirect_to :back
      end
      puts "#{session[:user]}"
   end

end
