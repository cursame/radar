module Manage
  # Groups controller for managers
  class GroupsController < Manage::BaseController
    load_and_authorize_resource

    def new
      @institution = Institution.find_by_id(params[:institution_id])
      @grade = Grade.find_by_id(params[:grade_id])
      @group = @grade.groups.build
    end

    def create
      @grade = Grade.find_by_id(params[:grade_id])
      if @grade.groups.create(group_params)
        flash[:notice] = I18n.t('flash.notice.group.create')
      else
        flash[:alert] = I18n.t('flash.alert.group.create')
      end
      redirect_to manage_institution_grade_groups_path(params[:institution_id], params[:grade_id])
    end

    def edit
      @institution = Institution.find_by_id(params[:institution_id])
      @grade = Grade.find_by_id(params[:grade_id])
      @group = Group.find_by_id(params[:id])
    end

    def update
      @group = Group.find_by_id(params[:id])
      if @group.update_attributes(group_params)
        flash[:notice] = I18n.t('flash.notice.group.update')
      else
        flash[:alert] = I18n.t('flash.alert.group.update')
      end
      redirect_to manage_institution_grade_groups_path(params[:institution_id], params[:grade_id])
    end

    def destroy
      @group = Group.find_by_id params[:id]
      @group.destroy
      flash[:notice] = I18n.t('flash.notice.group.destroy')
      redirect_to manage_institution_grade_groups_path(params[:institution_id], params[:grade_id])
    end

    private

    def group_params
      params.require(:group).permit(:title)
    end
  end
end
