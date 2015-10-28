class UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'superadmin'

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # TODO: Adds paginate
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new user_params
    grant_role(user, params[:role_id])
    user.password = Devise.friendly_token.first(8)
    if user.save
      flash[:notice] = I18n.t('flash.notice.user.create')
    else
      flash[:alert] = I18n.t('flash.alert.user.create')
    end
    redirect_to users_path
  end

  def show
    @user = User.find_by_id params[:id]
  end

  def edit
    @user = User.find_by_id params[:id]
  end

  def update
    @user = User.find_by_id params[:id]
    if @user.update user_params
      flash[:notice] = I18n.t('flash.notice.user.update')
    else
      flash[:alert] = I18n.t('flash.alert.user.update')
    end
    redirect_to users_path
  end

  def destroy
    @user = User.find_by_id params[:id]
    @user.destroy
    flash[:notice] = I18n.t('flash.notice.user.destroy')
    redirect_to users_path
  end

  def edit_password
    @user = User.find(params[:id])
  end

  def update_password
    @user = User.find(params[:id])
    if @user.update(update_user_password_params)
      flash[:notice] = I18n.t('flash.notice.user.update_password')
    else
      flash[:alert] = I18n.t('flash.alert.user.update_password')
    end
    redirect_to users_path
  end

  def edit_role
    @user = User.find(params[:id])
  end

  def update_role
    user = User.find(params[:id])
    user.roles = []
    grant_role(user, params[:role_id])
    flash[:notice] = I18n.t('flash.notice.user.update_role')
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :gender, :institution_id)
  end

  def update_user_password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def grant_role(user, role_id)
    role = Role.find(role_id)
    user.add_role role.name.to_sym
  end

  def record_not_found
    flash[:error] = I18n.t('flash.error.user.record_not_found')
    redirect_to users_path
  end
end
