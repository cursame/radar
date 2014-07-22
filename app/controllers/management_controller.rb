class ManagementController < ApplicationController
layout 'admin'
  before_filter :filter_session
  def applications
  	 @users = User.where(confirmation: false).paginate(:page => params[:page], :per_page => 30)
  end

  def hot_spots
  	 @redlight = RedLight.paginate(:page => params[:page], :per_page => 30).order('id DESC')
  end

  def institutions
    @institution = Institution.order(:name).paginate(:page => params[:page], :per_page => 30)
  end

  def users
  	 @users = User.where(confirmation: true).paginate(:page => params[:page], :per_page => 30)
  end
private
  ########### filtro de acceso al administrador #############
  def filter_session
    if session[:user] == nil
      redirect_to root_path
       else
        unless current_user.admin_attributes
          redirect_to user_path(current_user.id)
        end
    end
  end
end
