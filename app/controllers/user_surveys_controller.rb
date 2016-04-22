class UserSurveysController < ApplicationController
  def new
    @user_survey = UserSurvey.new
    @user_survey.build_aggressor
    @user_survey.build_victim
    @survey = Survey.find_by_id(params[:survey_id])
  end

  def create
    user_survey = UserSurvey.new(user_survey_params)
    user_answers = []
    params[:question_ids].each do |question_id|
      user_answers << UserAnswer.new(
        question_id: question_id,
        user_survey_id: user_survey.id
      )
    end
    user_survey.user_answers = user_answers
    user_survey.institution = current_institution
    if user_survey.save
      flash[:notice] = I18n.t('flash.notice.user_survey.create')
    else
      flash[:alert] = I18n.t('flash.alert.user_survey.create')
    end
    redirect_to root_path
  end

  private

  def user_survey_params
    params.require(:user_survey).permit(
      :survey_id,
      aggressor_attributes: [:name, :description],
      victim_attributes: [:name, :description]
    )
  end
end
