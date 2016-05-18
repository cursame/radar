require 'rails_helper'

feature 'User answers survey:' do

  scenario 'sees surveys' do
    survey = create(:survey_with_questions)
    survey2 = create(:survey_with_questions)

    visit root_path
    expect(page).to have_text survey.description
    expect(page).to have_text survey2.description
  end

  scenario 'can create an new user_survey', js: true do
    @survey = Survey.first
    @institution = Institution.first
    @grade = create(:grade, institution_id: @institution.id)
    @group = create(:group, grade_id: @grade.id)
    @student = create(:student, institution_id: @institution.id)

    visit root_path
    expect(page).to have_css("#survey_#{@survey.id}")
    click_on "survey_#{@survey.id}"
    click_on "new_user_survey_#{@survey.id}"

    find(:css, "#question_ids_[value='#{@survey.questions.first.id}']").set(true)
    fill_denouncer_attributes
    fill_aggressor_attributes
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

  def fill_aggressor_attributes
    fill_autocomplete('user_survey_aggressors_attributes_0_name', with: @student.name)
    select(@group.title, from: 'user_survey_aggressors_attributes_0_group_id')
  end

  def fill_autocomplete(field, options = {})
    fill_in field, with: options[:with]

    page.execute_script %{ $('##{field}').trigger('focus') }
    page.execute_script %{ $('##{field}').trigger('keydown') }
    selector = %{ul.ui-autocomplete li.ui-menu-item a:contains("#{options[:select]}")}

    expect(page).to have_selector('ul.ui-autocomplete li.ui-menu-item a')
    page.execute_script %{ $('#{selector}').trigger('mouseenter').click() }
  end
end
