module Admin
  class UsersController < ApplicationController
    # TODO: Adds paginate
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      user = User.new user_params
      user.password = Devise.friendly_token.first(8)
      if user.save
        flash[:notice] = I18n.t('flash.notice.user.create')
      else
        flash[:alert] = I18n.t('flash.alert.user.create')
      end
      redirect_to admin_users_path
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
      redirect_to admin_users_path
    end

    def destroy
      @user = User.find_by_id params[:id]
      @user.destroy
      redirect_to admin_users_path
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :gender, :institution_id)
    end
  end
end
