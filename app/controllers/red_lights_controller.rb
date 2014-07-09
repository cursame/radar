class RedLightsController < ApplicationController
  after_filter :set_access_control_headers, only: [:red_lights_js, :alert_point]

  def create
  	@red_ligth = RedLight.create(red_ligth_params)
    flash[:notice] = 'Cuestionario agregado correctamente'
    redirect_to :back
  end

  def new
  	@red_ligth = RedLight.new
  end

  def show
  	 @red_ligth = RedLight.find(params[:id])
  	 puts "***************#{@red_ligth}"
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
  	 params.require(:red_light).permit(:red_light,:mail, :name, :institution_code, :type_denunce, :cuestion_1, :cuestion_2, :cuestion_3, :cuestion_4, :cuestion_5, :cuestion_6, :cuestion_7, :cuestion_8, :cuestion_9, :cuestion_10, :cuestion_11, :cuestion_12, :cuestion_13, :cuestion_14, :cuestion_15, :cuestion_16, :cuestion_16, :cuestion_17, :cuestion_18, :cuestion_19, :cuestion_20, :history, :aggressors)
  end

  def paginate
    @institution = Institution.find_by_tokenspecialforms(params[:institution])
    @red_ligths = @institution.red_ligths.paginate(:page => params[:page], :per_page => 30)
    respod_to do |format|
      format.js
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
