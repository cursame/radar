module Manage
  # students controller for managers
  class StudentsController < Manage::BaseController
    load_and_authorize_resource
    has_scope :institution_id
    before_action :admin_institution

    def index
      @institution = Institution.find_by_id(params[:institution_id])
      @students = apply_scopes(Student).all
    end

    def new
      @institution = Institution.find_by_id(params[:institution_id])
      @student = @institution.students.build
    end

    def create
      @institution = Institution.find_by_id(params[:institution_id])
      if @institution.students.create(student_params)
        flash[:notice] = I18n.t('flash.notice.student.create')
      else
        flash[:alert] = I18n.t('flash.alert.student.create')
      end
      redirect_to manage_institution_students_path(institution_id: @institution.id)
    end

    def edit
      @institution = Institution.find_by_id(params[:institution_id])
      @student = Student.find_by_id params[:id]
    end

    def update
      @student = Student.find_by_id params[:id]
      if @student.update(student_params)
        flash[:notice] = I18n.t('flash.notice.student.update')
      else
        flash[:alert] = I18n.t('flash.alert.student.update')
      end
      redirect_to manage_institution_students_path(institution_id: params[:institution_id])
    end

    def destroy
      @student = Student.find_by_id params[:id]
      @student.destroy
      flash[:notice] = I18n.t('flash.notice.student.destroy')
      redirect_to manage_institution_students_path(institution_id: params[:institution_id])
    end

    private

    def student_params
      params.require(:student).permit(:name, :institution_id)
    end

    def admin_institution
      if current_user.has_role? :admin
        unless current_institution.id.to_s == params[:institution_id]
          flash[:alert] = I18n.t('flash.alert.student.access_denied')
          redirect_to manage_institution_path(current_institution)
        end
      end
    end
  end
end
