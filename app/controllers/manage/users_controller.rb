module Manage
  # User controller for managers
  class UsersController < Manage::BaseController
    load_and_authorize_resource

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
      if current_user.has_role? :superadmin
        @users = User.all
      else
        @users = User.where(institution_id: current_user.institution_id)
      end
    end

    def new
      @user = User.new
    end

    def create
      user = User.new(user_params)
      user.password = Devise.friendly_token.first(8)
      if user.save
        flash[:notice] = I18n.t('flash.notice.user.create')
      else
        flash[:alert] = I18n.t('flash.alert.user.create')
      end
      redirect_to manage_users_path
    end

    def edit
      @user = User.find_by_id params[:id]
    end

    def update
      @user = User.find_by_id params[:id]
      if @user.update(user_params)
        flash[:notice] = I18n.t('flash.notice.user.update')
      else
        flash[:alert] = I18n.t('flash.alert.user.update')
      end
      redirect_to manage_users_path
    end

    def destroy
      @user = User.find_by_id params[:id]
      @user.destroy
      flash[:notice] = I18n.t('flash.notice.user.destroy')
      redirect_to manage_users_path
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
      redirect_to manage_users_path
    end

    def grant_superadmin_role
      user = User.find(params[:id])
      user.add_role :superadmin
      flash[:notice] = I18n.t('flash.notice.user.update_role')
      redirect_to manage_users_path
    end

    def remove_superadmin_role
      user = User.find(params[:id])
      user.remove_role :superadmin
      flash[:notice] = I18n.t('flash.notice.user.update_role')
      redirect_to manage_users_path
    end

    def grant_admin_role
      user = User.find(params[:id])
      user.add_role :admin
      flash[:notice] = I18n.t('flash.notice.user.update_role')
      redirect_to manage_users_path
    end

    def remove_admin_role
      user = User.find(params[:id])
      user.remove_role :admin
      flash[:notice] = I18n.t('flash.notice.user.update_role')
      redirect_to manage_users_path
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :gender, :institution_id)
    end

    def update_user_password_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def record_not_found
      flash[:error] = I18n.t('flash.error.user.record_not_found')
      redirect_to superadmin_users_path
    end
  end
end
