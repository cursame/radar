class Manage::BaseController < ApplicationController
  layout 'manage'

  before_action :authenticate_user!
  before_action :authorize_access

  def index
    @institutions = Institution.count
    @users = User.count
    @complaints = 0
    @low_danger_complaints = 0
    @middle_danger_complaints = 0
    @high_danger_complaints = 0
  end

  private

  def authorize_access
    redirect_to root_path unless current_user_is_manager?
  end

  def current_user_is_manager?
    current_user.has_role?(:superadmin) || current_user.has_role?(:admin)
  end
end
