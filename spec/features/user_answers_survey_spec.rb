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
    @institution = @user.institution
    @grade = create(:grade, institution_id: @institution.id)
    @group = create(:group, grade_id: @grade.id)
    @aggressor_attributes = attributes_for(:aggressor)
    expect(page).to have_css("#survey_#{@survey.id}")
    click_on "new_user_survey_#{@survey.id}"

    find(:css, "#question_ids_[value='#{@survey.questions.first.id}']").set(true)
    fill_denouncer_attributes
    fill_in('user_survey_aggressors_attributes_0_name', with: @aggressor_attributes[:name])
    select(@group.title, from: 'user_survey_aggressors_attributes_0_group_id')
    click_on(I18n.t('user_surveys.shared.form.save'))

    sees_success_message(I18n.t('flash.notice.user_survey.create'))
    expect(current_path).to eq(root_path)
  end

  def fill_denouncer_attributes
    @denouncer_attributes = attributes_for(:denouncer)
    fill_in(
      'user_survey_denouncer_attributes_name',
      with: @denouncer_attributes[:name]
    )
    fill_in(
      'user_survey_denouncer_attributes_phone_number',
      with: @denouncer_attributes[:phone_number]
    )
    fill_in(
      'user_survey_denouncer_attributes_email',
      with: @denouncer_attributes[:email]
    )
    select(
      I18n.t('user_genders.male'),
      from: 'user_survey_denouncer_attributes_gender'
    )
    select(
      @group.title,
      from: 'user_survey_denouncer_attributes_group_id'
    )
  end
end
