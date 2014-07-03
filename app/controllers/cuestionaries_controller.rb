class CuestionariesController < ApplicationController
  def create  
  	@cuestionary = Cuestionary.create(cuestionary_params)
    redirect_to :back
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
  end

  def update
  end

  def index
  end
  
  def cuestionary_params
  	  params.require(:cuestionary).permit(:title, :call_code, :instructions, questions_attributes: [:title, :question_type] )
  end
end
