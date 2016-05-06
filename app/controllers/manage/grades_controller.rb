module Manage
  # Grades controller for managers
  class GradesController < Manage::BaseController
    load_and_authorize_resource

    def new
      @institution = Institution.find_by_id(params[:institution_id])
      @grade = @institution.grades.build
    end

    def edit
      @institution = Institution.find_by_id(params[:institution_id])
      @grade = Grade.find_by_id(params[:id])
    end

    def update
      @grade = Grade.find_by_id(params[:id])
      if @grade.update_attributes(grade_params)
        flash[:notice] = I18n.t('flash.notice.grade.update')
      else
        flash[:alert] = I18n.t('flash.alert.grade.update')
      end
      redirect_to grades_manage_institution_path(params[:institution_id])
    end

    def create
      @institution = Institution.find_by_id(params[:institution_id])
      if @institution.grades.create(grade_params)
        flash[:notice] = I18n.t('flash.notice.grade.create')
      else
        flash[:alert] = I18n.t('flash.alert.grade.create')
      end
      redirect_to grades_manage_institution_path(params[:institution_id])
    end

    def destroy
      @grade = Grade.find_by_id params[:id]
      @grade.destroy
      flash[:notice] = I18n.t('flash.notice.grade.destroy')
      redirect_to grades_manage_institution_path(params[:institution_id])
    end

    def groups
      @institution = Institution.find_by_id(params[:institution_id])
      @grade = Grade.find_by_id(params[:grade_id])
      @groups = @grade.groups unless @grade.nil?
    end

    private

    def grade_params
      params.require(:grade).permit(:title)
    end
  end
end
