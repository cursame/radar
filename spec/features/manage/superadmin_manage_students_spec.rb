require 'spec_helper'

feature Manage, 'manages sudents:' do
  background do
    @superadmin = create(:superadmin)
    @institution = create(:institution)
    given_logged_in_as(@superadmin)
  end

  scenario 'sees students index' do
    student1 = create(:student, institution_id: @institution.id)
    student2 = create(:student, institution_id: @institution.id)

    visit manage_institutions_path
    expect(page).to have_css("#institution_#{@institution.id}")
    click_on "show_students_institution_#{@institution.id}"

    expect(page).to have_text student1.name
    expect(page).to have_text student2.name
    expect(current_path).to eq(manage_institution_students_path(institution_id: @institution.id))
  end

  scenario 'can create a new student' do
    name = Faker::Name.name

    visit manage_institutions_path
    expect(page).to have_css("#institution_#{@institution.id}")
    click_on "show_students_institution_#{@institution.id}"
    click_on 'add_student'

    fill_in('student_name', with: name)
    click_on(I18n.t('manage.students.shared.form.save'))

    sees_success_message(I18n.t('flash.notice.student.create'))
    expect(Student.count).to eq(1)
    expect(page).to have_text name
    expect(current_path).to eq(manage_institution_students_path(institution_id: @institution.id))
  end
end
