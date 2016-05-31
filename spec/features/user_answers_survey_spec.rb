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
    create_group
    create_student

    visit root_path
    select_new_user_survey

    fill_denouncer_attributes
    answer_questions
    fill_aggressor_attributes
    fill_witness_attributes
    upload_file
    fill_evidence_link
    click_on(I18n.t('user_surveys.shared.form.save'))

    sees_success_message(I18n.t('flash.notice.user_survey.create'))
    expect(current_path).to eq(root_path)
  end

  scenario 'can create an new witness user_survey', js: true do
    @survey = Survey.find_by_type_survey('testigo')
    create_group
    create_student

    visit root_path
    select_new_user_survey

    fill_denouncer_attributes
    fill_victim_attributes
    answer_questions
    fill_aggressor_attributes
    fill_witness_attributes
    upload_file
    fill_evidence_link
    click_on(I18n.t('user_surveys.shared.form.save'))

    sees_success_message(I18n.t('flash.notice.user_survey.create'))
    expect(current_path).to eq(root_path)
  end

  def create_group
    @institution = Institution.first
    @grade = create(:grade, institution_id: @institution.id)
    @group = create(:group, grade_id: @grade.id)
  end

  def create_student
    @institution = Institution.first
    @student = create(:student, institution_id: @institution.id)
  end

  def select_new_user_survey
    expect(page).to have_css("#survey_#{@survey.id}")
    click_on "survey_#{@survey.id}"
    click_on "new_user_survey_#{@survey.id}"
  end

  def answer_questions
    find(:css, "#question_ids_[value='#{@survey.questions.first.id}']").set(true)
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

  def fill_victim_attributes
    fill_autocomplete('user_survey_victim_attributes_name', with: @student.name)
    select(@group.title, from: 'user_survey_victim_attributes_group_id')
  end

  def fill_aggressor_attributes
    fill_autocomplete('user_survey_aggressors_attributes_0_name', with: @student.name)
    select(@group.title, from: 'user_survey_aggressors_attributes_0_group_id')
  end

  def fill_witness_attributes
    fill_autocomplete('user_survey_witnesses_attributes_0_name', with: @student.name)
    select(@group.title, from: 'user_survey_witnesses_attributes_0_group_id')
  end

  def upload_file
    attach_file('user_survey_evidence', File.join(Rails.root, '/spec/support/files/video.mov'))
  end

  def fill_evidence_link
    fill_in(
      'user_survey_evidence_links_attributes_0_url',
      with: Faker::Internet.url
    )
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
