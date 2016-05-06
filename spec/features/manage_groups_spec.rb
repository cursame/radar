require 'rails_helper'

feature 'Manage groups:' do
  background do
    @admin = create(:admin)
    given_logged_in_as(@admin)
  end

  scenario 'can create group' do
    group_title = Faker::Name.grade_group
    institution = create(:institution)
    grade = create(:grade, institution_id: institution.id)

    visit edit_manage_institution_path(institution.id)
    click_on(I18n.t('manage.institutions.shared.form.edit_grades'))

    expect(page).to have_css("#grade_#{grade.id}")
    click_on "edit_groups_grade_#{grade.id}"

    click_on(I18n.t('manage.grades.groups.add_group'))

    fill_in('group_title', with: group_title)
    click_on(I18n.t('manage.groups.shared.form.save'))

    sees_success_message(I18n.t('flash.notice.group.create'))
    expect(current_path).to eq(manage_institution_grade_groups_path(institution_id: institution.id, grade_id: grade.id))
    expect(page).to have_text group_title
  end

  scenario 'can edit group' do
    group_title = Faker::Name.grade_group
    institution = create(:institution)
    grade = create(:grade, institution_id: institution.id)
    group = create(:group, grade_id: grade.id)

    visit edit_manage_institution_path(institution.id)
    click_on(I18n.t('manage.institutions.shared.form.edit_grades'))

    expect(page).to have_css("#grade_#{grade.id}")
    click_on "edit_groups_grade_#{grade.id}"

    expect(page).to have_css("#group_#{group.id}")
    click_on "edit_group_#{group.id}"

    fill_in('group_title', with: group_title)
    click_on(I18n.t('manage.groups.shared.form.save'))

    sees_success_message(I18n.t('flash.notice.group.update'))
    expect(current_path).to eq(manage_institution_grade_groups_path(institution_id: institution.id, grade_id: grade.id))
    expect(page).to have_text group_title
  end

  scenario 'can delete group' do
    institution = create(:institution)
    grade = create(:grade, institution_id: institution.id)
    group = create(:group, grade_id: grade.id)

    visit edit_manage_institution_path(institution.id)
    click_on(I18n.t('manage.institutions.shared.form.edit_grades'))

    expect(page).to have_css("#grade_#{grade.id}")
    click_on "edit_groups_grade_#{grade.id}"

    expect(page).to have_css("#group_#{group.id}")
    click_on "delete_group_#{group.id}"
    sleep(1)

    sees_success_message(I18n.t('flash.notice.group.destroy'))
    expect(current_path).to eq(manage_institution_grade_groups_path(institution_id: institution.id, grade_id: grade.id))
  end
end
