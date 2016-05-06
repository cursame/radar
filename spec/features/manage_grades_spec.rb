require 'rails_helper'

feature 'Manage grades:' do
  background do
    @admin = create(:admin)
    given_logged_in_as(@admin)
  end

  scenario 'can create grade' do
    grade_title = Faker::Name.institution_grade
    institution = create(:institution)

    visit edit_manage_institution_path(institution.id)
    click_on(I18n.t('manage.institutions.shared.form.edit_grades'))

    click_on(I18n.t('manage.institutions.grades.add_grade'))

    fill_in('grade_title', with: grade_title)
    click_on(I18n.t('manage.grades.shared.form.save'))

    sees_success_message(I18n.t('flash.notice.grade.create'))
    expect(current_path).to eq(grades_manage_institution_path(institution.id))
    expect(page).to have_text grade_title
  end

  scenario 'can edit institution grade' do
    grade_title = Faker::Name.institution_grade
    institution = create(:institution)
    grade = create(:grade, institution_id: institution.id)

    visit edit_manage_institution_path(institution.id)
    click_on(I18n.t('manage.institutions.shared.form.edit_grades'))

    expect(page).to have_css("#grade_#{grade.id}")
    click_on "edit_grade_#{grade.id}"

    fill_in('grade_title', with: grade_title)
    click_on(I18n.t('manage.grades.shared.form.save'))

    sees_success_message(I18n.t('flash.notice.grade.update'))
    expect(current_path).to eq(grades_manage_institution_path(institution.id))
    expect(page).to have_text grade_title
  end

  scenario 'can delete institution grade' do
    institution = create(:institution)
    grade = create(:grade, institution_id: institution.id)

    visit edit_manage_institution_path(institution.id)
    click_on(I18n.t('manage.institutions.shared.form.edit_grades'))

    expect(page).to have_css("#grade_#{grade.id}")
    click_on "delete_grade_#{grade.id}"
    sleep(1)

    sees_success_message(I18n.t('flash.notice.grade.destroy'))
    expect(current_path).to eq(grades_manage_institution_path(institution.id))
  end
end
