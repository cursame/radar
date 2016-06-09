class UserSurveyMailer < ActionMailer::Base
  def denouncer_mail(user_survey_id)
    @user_survey = UserSurvey.find_by_id(user_survey_id)
    @denouncer = @user_survey.denouncer
    mail(
      to: @denouncer.email,
      from: MAILER_FROM,
      subject: I18n.t('user_survey_mailer.denouncer_mail.subject')
    )
  end
end
