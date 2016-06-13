require 'rails_helper'

describe UserSurveyMailer do
  let(:user_survey) { create(:user_survey) }
  let(:mail) { UserSurveyMailer.denouncer_mail(user_survey.id) }

  it 'renders the receiver email' do
    expect(mail.to).to eql([user_survey.denouncer.email])
  end

  it 'renders the subject' do
    expected_subject = I18n.t('user_survey_mailer.denouncer_mail.subject')
    expect(mail.subject).to eql(expected_subject)
  end
end
