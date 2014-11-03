class ManagementController < ApplicationController
layout 'admin'
  before_filter :filter_session
  before_filter :put_admin_button 
  after_filter :path_to_return
  def applications
  	 @users = User.where(confirmation: false).paginate(:page => params[:page], :per_page => 30)
  end

  def hot_spots
  	 @red_lights = RedLight.paginate(:page => params[:page], :per_page => 30).order('id DESC')
  end

  def institutions
    @institution = Institution.order(:name).paginate(:page => params[:page], :per_page => 30)
  end

  def users
  	 @users = User.where(confirmation: true).paginate(:page => params[:page], :per_page => 30)
  end

  def analitics
    moderadas = 0
    medias = 0
    graves = 0

    @institutions = Institution.count
    @red_lights = RedLight.count
    @institutions_xht = RedLight.all 
    
    fisico = 0
    amenaza = 0 
    exclusion = 0 
    indefencion = 0 
    malestar_escolar = 0 
    violencia_verbal = 0 
    burla = 0
    cyber_bullying = 0
    dano_a_pertenencias = 0
    @institutions_xht.each do |ins|
       case ins.operator
         when "Peligrosidad Moderada"
          moderadas = moderadas +1
         when "Peligrosidad Media"
          medias = medias +1
         when "Peligrosidad Grave"
          graves = graves +1
       end

     case ins.type_denunce
      when 'personal'
        if ins.question_1 == true && ins.question_2 == true
          fisico = fisico + 1
        end
        if ins.question_3 == true && ins.question_4 == true
          amenaza = amenaza + 1
        end
        if (ins.question_5 == true && ins.question_6 == true) || (ins.question_6 == true && ins.question_7 == true) || (ins.question_5 == true && ins.question_7 == true)
          exclusion = exclusion + 1
        end
        if ins.question_8 == true && ins.question_9 == true
          indefencion = indefencion + 1
        end
        if ins.question_10 == true && ins.question_11 == true
          malestar_escolar = malestar_escolar + 1
        end
        if ins.question_12 == true && ins.question_13 == true
          violencia_verbal = violencia_verbal + 1
        end
        if ins.question_14 == true && ins.question_15 == true
          burla = burla + 1
        end
        if ins.question_16 == true && ins.question_17 == true
          cyber_bullying  = cyber_bullying + 1
        end
        if ins.question_18 == true && ins.question_19 == true
          dano_a_pertenencias = dano_a_pertenencias + 1
        end
     when 'non personal'
        if ins.question_1 == true && ins.question_2 == true
          fisico = fisico + 1
        end
        if ins.question_3 == true && ins.question_4 == true
          amenaza = amenaza + 1
        end
        if ins.question_5 == true && ins.question_6 == true
          exclusion = exclusion + 1
        end
        if ins.question_8 == true && ins.question_9 == true
          indefencion = indefencion + 1
          malestar_escolar = malestar_escolar + 1
        end
        if ins.question_10 == true && ins.question_11 == true
          violencia_verbal = violencia_verbal + 1
          burla = burla + 1
        end
        if ins.question_12 == true && ins.question_13 == true
          cyber_bullying  = cyber_bullying + 1
        end
     end
    end  
    @moderadas = moderadas
    @medias = medias
    @graves = graves   
    @fisico = fisico
    @amenaza = amenaza 
    @exclusion = exclusion 
    @indefencion = indefencion 
    @malestar_escolar = malestar_escolar 
    @violencia_verbal = violencia_verbal 
    @burla = burla
    @cyber_bullying = cyber_bullying
    @dano_a_pertenencias = dano_a_pertenencias   
  end

  def create_supervisor
    @user = User.create(name: params[:name], email: params[:email], charge: 'Supervisor', password: Digest::SHA2.hexdigest('supervisor1234'), password_confirmation: Digest::SHA2.hexdigest('supervisor1234') , salt:  rand(235..1234),  terms_of_service: true, confirmation: true, admin_attributes: false, adviser: true, adviser_code: rand(5000..909090), help_institution_id: params[:institution_id])
    flash[:notice] = 'El usuario supervisor ha sido agregado correctamente'
    redirect_to :back
  end

  def create_institution
      @in = HelpInstitution.create( name: params[:name], identifier: rand(3..5000), addres: params[:addres], phone: params[:phone],  ext: params[:ext])
      flash[:notice] = 'Se ha agregado correctamente la organización para prevención'
      redirect_to :back
  end
private
  ########### filtro de acceso al administrador #############
  def filter_session
    if session[:user] == nil
      redirect_to root_path
       else
        unless current_user.admin_attributes
          redirect_to user_path(current_user.id)
        end
    end
  end

  def put_admin_button
    session[:admin_button] = true
  end

  def path_to_return
     session[:back_to] = request.original_url
     puts "*************** #{request.original_url}"
  end
end
