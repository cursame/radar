module Manage
  # UserSurvey controller for managers
  class UserSurveysController < Manage::BaseController
    def index
      @user_surveys = current_institution.user_surveys
    end

    def show
      @user_survey = UserSurvey.find(params[:id])
    end
  end
end
