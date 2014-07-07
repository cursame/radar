class RedLightsController < ApplicationController
  def create
  	@red_ligth = RedLight.create(red_ligth_params)
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

  def red_ligth_params
  	 params.require(:red_light).permit(:red_light,:mail, :name, :institution_code, :type_denunce, :cuestion_1, :cuestion_2, :cuestion_3, :cuestion_4, :cuestion_5, :cuestion_6, :cuestion_7, :cuestion_8, :cuestion_9, :cuestion_10, :cuestion_11, :cuestion_12, :cuestion_13, :cuestion_14, :cuestion_15, :cuestion_16, :cuestion_16, :cuestion_17, :cuestion_18, :cuestion_19, :cuestion_20, :history, :aggressors)
  end
  


end
