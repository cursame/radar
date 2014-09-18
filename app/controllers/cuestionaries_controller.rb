class CuestionariesController < ApplicationController
  layout 'responce_forms', only: [:view]
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
  end

  def responce
     @rand = SecureRandom.hex(7)
     puts @rand
     params[:opt].each do |index,optn|
       puts optn
       @responce = ResponceQuest.create(opt: index, cuestionary_id: params[:cuestionary], responce: optn.to_s, code_responce: @rand)
       puts @responce
       #optn.each do |res|
        #@a =  Array(res)
       #end
     end

    redirect_to view_responces_path(@responce.code_responce)
  end

  def view_responces
  end
  
  def cuestionary_params
  	  params.require(:cuestionary).permit(:title, :call_code, :instructions, questions_attributes: [:title, :question_type, :question_requires] )
  end
end
