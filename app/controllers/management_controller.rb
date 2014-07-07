class ManagementController < ApplicationController
  def applications
  	 @users = User.where(confirmation: false)
  end

  def hot_spots
  end

  def institutions
  end
end
