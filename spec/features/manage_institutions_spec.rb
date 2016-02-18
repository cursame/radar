require 'rails_helper'

feature 'Manage institutions:' do
  background do
    @superadmin = create(:superadmin)
    given_logged_in_as(@superadmin)
  end

  scenario 'sees institutions index' do
    institution1 = create(:institution)
    institution2 = create(:institution)

    expect(page).to have_link(I18n.t('manage.shared.navbar.show_institutions'))
    click_on(I18n.t('manage.shared.navbar.show_institutions'))

    expect(page).to have_text institution1.title
    expect(page).to have_text institution2.title
    expect(current_path).to eq(manage_institutions_path)
  end

  scenario 'can create a new institution' do
    click_on(I18n.t('manage.shared.navbar.add_institution'))

    fill_in('institution_title', with: Faker::Name.name)
    fill_in('institution_subdomain', with: Faker::Internet.domain_word)
    click_on(I18n.t('manage.institutions.shared.form.save'))

    sees_success_message(I18n.t('flash.notice.institution.create'))
    expect(Institution.count).to eq(2)
    expect(current_path).to eq(manage_institutions_path)
  end

  scenario 'can edit an institution' do
    institution = create(:institution)
    institution_title = Faker::Name.name
    institution_subdomain = Faker::Internet.domain_word

    visit manage_institutions_path
    expect(page).to have_css("#institution_#{institution.id}")
    click_on "edit_institution_#{institution.id}"

    fill_in('institution_title', with: institution_title)
    fill_in('institution_subdomain', with: institution_subdomain)
    click_on(I18n.t('manage.institutions.shared.form.save'))

    sees_success_message(I18n.t('flash.notice.institution.update'))
    expect(current_path).to eq(manage_institution_path(institution.id))
    expect(page).to have_text institution_title
    expect(page).to have_text institution_subdomain
  end

  scenario 'can delete an institution' do
    institution = create(:institution)

    visit manage_institutions_path

    expect(page).to have_css("#institution_#{institution.id}")
    click_on "delete_institution_#{institution.id}"
    sleep(1)

    sees_success_message(I18n.t('flash.notice.institution.destroy'))
    expect(current_path).to eq(manage_institutions_path)
    expect(page).to have_no_text institution.title
    expect(page).to have_no_text institution.subdomain
  end
end
