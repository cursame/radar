class ManagementController < ApplicationController
layout 'admin'
  def applications
  	 @users = User.where(confirmation: false)
  end

  def hot_spots
  end

  def institutions
  end

  def users
  	 @users = User.where(confirmation: true)
  end
private
  def filter
  end
end
