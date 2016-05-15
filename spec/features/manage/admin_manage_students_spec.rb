require 'spec_helper'

feature Manage, 'manages sudents:' do
  background do
    @admin = create(:admin)
    @institution = @admin.institution
    given_logged_in_as(@admin)
  end

  scenario 'sees students index' do
    student1 = create(:student, institution_id: @institution.id)
    student2 = create(:student, institution_id: @institution.id)

    click_on(I18n.t('manage.shared.navbar.show_students'))

    expect(page).to have_text student1.name
    expect(page).to have_text student2.name
    expect(current_path).to eq(manage_institution_students_path(institution_id: @institution.id))
  end

  scenario 'can create an new student' do
    name = Faker::Name.name
    click_on(I18n.t('manage.shared.navbar.add_student'))

    fill_in('student_name', with: name)
    click_on(I18n.t('manage.students.shared.form.save'))

    sees_success_message(I18n.t('flash.notice.student.create'))
    expect(Student.count).to eq(1)
    expect(page).to have_text name
    expect(current_path).to eq(manage_institution_students_path(institution_id: @institution.id))
  end

  scenario 'can edit an student' do
    student = create(:student, institution_id: @institution.id)
    new_name = Faker::Name.name

    visit manage_institution_students_path(institution_id: @institution.id)
    expect(page).to have_css("#student_#{student.id}")
    click_on "edit_student_#{student.id}"

    fill_in('student_name', with: new_name)
    click_on(I18n.t('manage.students.shared.form.save'))

    sees_success_message(I18n.t('flash.notice.student.update'))
    expect(page).to have_text new_name
    expect(current_path).to eq(manage_institution_students_path(institution_id: @institution.id))
  end

  scenario 'can delete an student' do
    student = create(:student, institution_id: @institution.id)

    visit manage_institution_students_path(institution_id: @institution.id)
    expect(page).to have_css("#student_#{student.id}")
    click_on "delete_student_#{student.id}"
    sleep(1)

    sees_success_message(I18n.t('flash.notice.student.destroy'))
    expect(page).to have_no_text student.name
    expect(current_path).to eq(manage_institution_students_path(institution_id: @institution.id))
  end
end
