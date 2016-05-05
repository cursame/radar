module Manage
  # Institution controller for managers
  class InstitutionsController < Manage::BaseController
    load_and_authorize_resource
    skip_authorize_resource only: [:show, :grades]

    def index
      @institutions = Institution.all
    end

    def show
      @institution = Institution.find(params[:id])
    end

    def new
      @institution = Institution.new
    end

    def create
      if Institution.create(institution_params)
        flash[:notice] = I18n.t('flash.notice.institution.create')
      else
        flash[:alert] = I18n.t('flash.alert.institution.create')
      end
      redirect_to manage_institutions_path
    end

    def edit
      @institution = Institution.find_by_id(params[:id])
    end

    def update
      @institution = Institution.find_by_id params[:id]
      if @institution.update(institution_params)
        flash[:notice] = I18n.t('flash.notice.institution.update')
      else
        flash[:alert] = I18n.t('flash.alert.institution.update')
      end
      redirect_to manage_institution_path(params[:id])
    end

    def destroy
      @institution = Institution.find_by_id params[:id]
      @institution.destroy
      flash[:notice] = I18n.t('flash.notice.institution.destroy')
      redirect_to manage_institutions_path
    end

    def grades
      @institution = Institution.find_by_id(params[:id])
      @grades = @institution.grades unless @institution.nil?
    end

    private

    def institution_params
      params.require(:institution).permit(
        :title,
        :subdomain,
        grade_attributes: [:title]
      )
    end
  end
end
