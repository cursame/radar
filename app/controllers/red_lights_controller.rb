class RedLightsController < ApplicationController
  after_filter :set_access_control_headers, only: [:red_lights_js, :alert_point]
  before_filter :red_filter, only: [:show]
  def create
  	@red_ligth = RedLight.create(red_ligth_params)
    @user = User.where(:adviser => true).order("RANDOM()").first
    @red_ligth.adviser = @user.adviser_code
    @red_ligth.save
    if @red_ligth.save
      flash[:notice] = 'Cuestionario agregado correctamente'
      @institution = Institution.find_by_tokenspecialforms(@red_ligth.institution_code)
      @mailer = InstitutionManagment.red_alert(@institution.user).deliver
       else
      flash[:notice] = "Por alguna razón no hemos podido agregar el cuestionario."
    end
    redirect_to :back
  end

  def new
  	@red_ligth = RedLight.new
  end

  def show
  	 @red_ligth = RedLight.find(params[:id])
  end

  def dresser_attacks 
  	 @red_ligth = RedLight.new
  end

  def dresser_conflicts
  	 @red_ligth = RedLight.new
  end

  def alert_point
     @institution = params[:institution]
     @red_ligth = RedLight.new
     @i = Institution.find_by_tokenspecialforms(params[:institution])
     @url = @i.url
  end

  def index
  end


  def red_lights_js
    @institution = Institution.find_by_tokenspecialforms(params[:institution])
    @origin = request.referrer
    @nots = "Acceso no permitido ya que su url no coincide con la url que se ha indicado en el registro."
    url_embed = 'http://localhost:3000/alert_point?institution=' + "#{@institution.tokenspecialforms}"
    @iframe = "<iframe src=#{url_embed} width='100%' height='100%' frameBorder='0'></iframe>"
   
    if  parce_url(@institution.url, @origin, params[:pathx] )
    render :json =>  @iframe.to_json
     else
    render :json =>  @nots.to_json

    end
  end


  def red_ligth_params
  	 params.require(:red_light).permit(:red_light,:mail, :name, :institution_code, :type_denunce, :question_1, :question_2, :question_3, :question_4, :question_5, :question_6, :question_7, :question_8, :question_9, :question_10, :question_11, :question_12, :question_13, :question_14, :question_15, :question_16, :question_16, :question_17, :question_18, :question_19, :question_20, :history, :aggressors, :adviser)
  end

  def paginate
    @institution = Institution.find(params[:institution])
    @red_lights = @institution.red_lights.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    if params[:page].to_i != @red_lights.total_pages.to_i
      @actual_page = params[:page].to_i + 1
     else 
      @actual_page = 0
    end

    respond_to do |format|
      format.js
    end
  end
  
  def red_filter
    if session[:user] != nil
       if current_user.adviser
           @red_ligth = RedLight.find_by_id_and_adviser(params[:id], current_user.adviser_code )
            if @red_ligth
              puts "acceso consedido"
            else
              puts "acceso denegado"
              redirect_to user_path(current_user.id)
            end
       else
           @red_ligth = RedLight.find(params[:id])
           if @red_ligth
             @i = Institution.find_by_tokenspecialforms(@red_ligth.institution_code)
               if current_user.id == @i.user.id
                   puts "acceso consedido"
               else
                redirect_to user_path(current_user.id)
               end
           else
              redirect_to user_path(current_user.id)
           end
       end
      else
      redirect_to root_path
    end
  end
  def parce_url(url, acces, pathx)
    ######### parce url #########
    remove = ['http', 'https', '/', 'www', ':', '.', "#{pathx}"]
    @rl = url
    @ac = acces
    ######## parce r ########
    remove.each do |r|
     @rl = @rl.remove("#{r}")
     @ac = @ac.remove("#{r}")
    end
    case "#{@ac}" 
      when "#{@rl}"
        true
      when "localhost8000"
        true
      else
        false
    end
  end
 
  
  def set_access_control_headers  
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    response.headers.delete('X-Frame-Options')
  end

end
