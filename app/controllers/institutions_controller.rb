class InstitutionsController < ApplicationController
  def update
     @institution = Institution.find(params[:id])
     @institution.name = params[:name]
     @institution.url = params[:url]
     @institution.phone = params[:phone]
     @institution.extencion = params[:extencion]
     @institution.address = params[:address]
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

  def help_intitution_contact
     if session[:user] == nil
       redirect_to root_path
     else
     @us = current_user
     @title = params[:title]
     @description = params[:description]
     @i =  HelpInstitution.all
       @i.each do |i|
         @mailer = InstitutionManagment.contact_institutions(@us, i, @title, @description ).deliver
       end
      flash[:notice] = 'Te has puesto en contacto con las insitituciones de apoyo anti bullying'
      redirect_to :back
    end
  end

  def destroy_institution
    @institution = Institution.find(params[:id])
    @institution.destroy
    flash[:notice] = 'Insitución eliminada correctamente'
    redirect_to :back
  end

  

end
