class StaticsViewsController < ApplicationController
  before_filter :session_act
  def home
  end

  def panel
  end

  def diagnostico
  end

  def foco_rojo
  end

  def contacto
  end

  def nosotros
  end

  def mail_to_contact
    respond_to do |format|
      format.html
    end
  end
private
  def session_act
    if session[:user] != nil
       redirect_to user_path(current_user.id)
    end
  end
end
