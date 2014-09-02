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
  
  def actualizaciones
  end

  def mail_to_contact
    @person = "Email: #{params[:email]}, Nombre: #{params[:nombre]}, Institución #{params[:institucion]}, Cargo #{params[:cargo]}, Teléfono: #{params[:phone]}, Extención: #{params[:extencion]}"
    @message = "Tema: #{params[:tema]}"

    @message_sending = InstitutionManagment.contact(@message, @person).deliver

    respond_to do |format|
      format.html
    end
  end

  def subscriber
    @suscriber = Subscriber.create(email: params[:email])
    if @suscriber.save
      respond_to do |format|
        format.html
      end
    else
      flash[:notice] = 'No se ha podido realizar tu subscripcción a nuestros contenidos'
      redirect_to :back
    end
  end

  def lenguaje
    session[:languaje] = params[:lenguje]
    redirect_to :back
  end
private
  def session_act
    if session[:user] != nil
       redirect_to user_path(current_user.id)
    end
  end
end
