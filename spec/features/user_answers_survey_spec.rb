require 'rails_helper'

feature 'User answers survey:' do
  background do
    @user = create(:user)
    @survey = create(:survey_with_questions)
    @survey2 = create(:survey_with_questions)
    given_logged_in_as(@user)
  end

  scenario 'sees surveys' do
    expect(page).to have_text @survey.description
    expect(page).to have_text @survey2.description
  end

  scenario 'can create an new user_survey' do
    @aggressor_attributes = attributes_for(:aggressor)
    expect(page).to have_css("#survey_#{@survey.id}")
    click_on "new_user_survey_#{@survey.id}"

    find(:css, "#question_ids_[value='#{@survey.questions.first.id}']").set(true)
    fill_in('user_survey_aggressor_attributes_name', with: @aggressor_attributes[:name])
    fill_in('user_survey_aggressor_attributes_description', with: @aggressor_attributes[:description])
    click_on(I18n.t('user_surveys.shared.form.save'))

    sees_success_message(I18n.t('flash.notice.user_survey.create'))
    expect(current_path).to eq(root_path)
  end
end
