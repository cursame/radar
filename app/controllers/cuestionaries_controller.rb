class CuestionariesController < ApplicationController
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

  def update
  end

  def index
  end

  def responce
     params[:opt].each do |optn|
       puts optn
       optn.each do |res|
        @a =  Array(res)
       end
     end

    redirect_to :back
  end
  
  def cuestionary_params
  	  params.require(:cuestionary).permit(:title, :call_code, :instructions, questions_attributes: [:title, :question_type, :question_requires] )
  end
end
