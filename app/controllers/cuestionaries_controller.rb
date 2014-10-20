class CuestionariesController < ApplicationController
  before_filter :filter_to_options, only: [:index, ]
  layout 'responce_forms', only: [:view, :create]
  layout 'admin', only: [:index, :new]

  def create  
  	@cuestionary = Cuestionary.create(cuestionary_params)
    redirect_to view_questionary_path(@cuestionary.id)
  end

  def edit
  end

  def new
    @cuestionary = Cuestionary.new
    @question = Question.new
    
    questions = @cuestionary.questions.build

  end


  def delete
  end

  def view
   @port =  Cuestionary.find(params[:id])
  end

  def view_responce
  end

  def update
  end

  def index
    @institutions = Institution.all
    @questionaries = Cuestionary.last 10

  end

  def responce
     @rand = SecureRandom.hex(7)
     puts @rand
     @institution = current_user.institutions.first
     params[:opt].each do |index,optn|
       puts optn
       @responce = ResponceQuest.create(opt: index, cuestionary_id: params[:cuestionary], responce: optn.to_s, code_responce: @rand, institution_id: @institution.id)
     end

    redirect_to view_responces_path(@responce.code_responce)
  end


  def view_responces
     if params[:responce_quest] != nil
     @responces = ResponceQuest.where(code_responce: params[:responce_quest])
     @content = ''
     else
     @active = 'Necesitas un codigo de respuesta para visualizar'
     end
     respond_to do |format|
      format.html
     end
  end

  def filter_repsonces
    require 'csv'
    require 'render_csv'
     column_names = []

     @c = Cuestionary.find(params[:cuestionarios])
     @i = Institution.find(params[:instituciones])

     @orq = @c.responce_quests.all

      @c.questions.each do |q|
         column_names.push(q.title)
      end
      
      @counterx = @c.questions.count 

      @c1 = 0
      column_ext = []
      context = []
      column_names_identifier = column_names.length 
      count_hethers = 0
      ################ atrapa y convierte las variables de los arrays #######
      @orq.each do |r|

          @responce = r.responce.to_s
          ######### se manda el context a un array ######
          if @c1 != @counterx 
                #puts count_hethers
                ########### se hacen los array para convertirlo en un hash ##########
                @c1 = @c1 + 1
                @indentifier = column_names[count_hethers]
                #puts @indentifier
                @a1 = Array(@indentifier )
                @a2 = Array( @responce )
                @a3 = @a1 + @a2
                
                context.push(  @a3 )
                count_hethers = count_hethers + 1

               ############# se reinicia el contador ###########
               if count_hethers == column_names_identifier
                 #puts "************* reinicia"
                count_hethers = 0
               end
               #puts "#{context}"
               else
               @contextual = Hash[ context ]
               #@contextual = Array[context]
               #puts  @contextual
               session[:context] =   @contextual
               column_ext.push(session[:context])  
               @c1 = 0
               @ar =  session[:context].to_a
               if @ar.length == @counterx
                session[:context] = nil
                context.clear
                @counterx = 0
                @counterx = @c.questions.count 

               end
          end
      end
      ########## itera el csv de tal forma que lo prepara para convertirlo en texto plano ########
      casv = CSV.generate do |csv|
        csv << column_names
        column_ext.each do |hash|
        csv <<  hash.values_at(*column_names)
        end
      end
    ############ convierte el texto plano en csv ############ 
    render :csv => Array(CSV.generate( casv, options = Hash.new ) { |csv| csv })
  end

  def csv_act(questionary, institution)
     require 'csv'     
  end
  def cuestionary_params
  	  params.require(:cuestionary).permit(:title, :call_code, :instructions, questions_attributes: [:title, :question_type, :question_requires] )
  end
  
private
  
  def filter_to_options
     if session[:user] == nil
       redirect_to root_path
      else
        if current_user.admin_attributes

        else
          redirect_to root_path
        end
     end
  end


end
