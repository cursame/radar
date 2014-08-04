class InstitutionsController < ApplicationController
  def update
     @institution = Institution.find(params[:id])
     @institution.name = params[:name]
     @institution.url = params[:url]
     @institution.phone = params[:phone]
     @institution.extencion = params[:extencion]
     @institution.save
     if @institution.save
       flash[:notice] = ' Se han guardado correctamente los cambios'
       redirect_to :back
     else
       flash[:notice] = 'Debido a alguna contingencia no ha sido posible guardar los cambios'
       redirect_to :back
     end
  end

  def edit
  	@institution = Institution.find(params[:id])
  	respond_to do |format|
  		format.js
  	end
  end

  def cancel
  	@institution = Institution.find(params[:id])
	respond_to do |format|
  		format.js
  	end
  end
end
