class ManagementController < ApplicationController
layout 'admin'
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
  def filter

  end
end
