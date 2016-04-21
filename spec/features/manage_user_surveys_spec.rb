require 'rails_helper'

feature 'Manage UserSurveys:' do
  background do
    @institution = create(:institution)
    @admin = create(:admin, institution: @institution)
    @survey = create(:survey_with_questions)
    @user1 = create(:user, institution: @institution)
    @user_survey1 = create(:user_survey, user: @user1, survey: @survey, institution: @institution)
    given_logged_in_as(@admin)
  end

  scenario 'sees user_surveys index' do
    @user2 = create(:user, institution: @institution)
    @user_survey2 = create(:user_survey, user: @user2, survey: @survey, institution: @institution)
    expect(page).to have_link(I18n.t('manage.shared.navbar.complaints'))
    click_on(I18n.t('manage.shared.navbar.complaints'))

    expect(page).to have_text @user_survey1.name_state
    expect(page).to have_text @user_survey2.name_state
    expect(current_path).to eq(manage_user_surveys_path)
  end

  scenario 'sees one user_survey' do
    visit manage_user_surveys_path

    expect(page).to have_css("#user_survey_#{@user_survey1.id}")
    click_on "show_user_survey_#{@user_survey1.id}"

    expect(page).to have_text @user_survey1.name_state
    expect(page).to have_text @user_survey1.violence_types_array.first
    expect(page).to have_text @user_survey1.user_answers.first.question.text
    expect(page).to have_text @user_survey1.user_answers.second.question.text
  end
end
