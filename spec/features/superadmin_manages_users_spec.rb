require 'rails_helper'

feature 'Superadmin manages users:' do
  background do
    @superadmin = create(:superadmin)
    given_logged_in_as(@superadmin)
  end

  scenario 'sees users index' do
    user1 = create(:user)
    user2 = create(:user)
    expect(page).to have_link(I18n.t('superadmin.shared.navbar.show_users'))
    click_on(I18n.t('superadmin.shared.navbar.show_users'))

    expect(page).to have_text user1.name
    expect(page).to have_text user2.name
    expect(current_path).to eq(users_path)
  end

  scenario 'can create an new user' do
    institution = create(:institution)
    click_on(I18n.t('superadmin.shared.navbar.add_user'))

    fill_in('user_name', with: Faker::Name.name)
    fill_in('user_email', with: Faker::Internet.email)
    select(institution.title, from: 'user_institution_id')
    select('superadmin', from: 'role_id')
    click_on(I18n.t('users.shared.form.save'))

    sees_success_message(I18n.t('flash.notice.user.create'))
    expect(User.count).to eq(2)
    expect(current_path).to eq(users_path)
  end

  scenario 'can edit an user' do
    user = create(:user)
    institution = create(:institution)
    new_name  = Faker::Name.name
    new_email = Faker::Internet::email

    visit "/users"
    expect(page).to have_css("#user_#{user.id}")
    click_on "edit_user_#{user.id}"

    fill_in('user_name', with: new_name)
    fill_in('user_email', with: new_email)
    select(institution.title, from: 'user_institution_id')
    click_on(I18n.t('users.shared.form.save'))

    sees_success_message(I18n.t('flash.notice.user.update'))
    expect(current_path).to eq(users_path)
    expect(page).to have_text new_name
    expect(page).to have_text institution.title
    expect(page).to have_text new_email
  end

  scenario 'can delete an user' do
    user = create(:user)
    visit "/users"

    expect(page).to have_css("#user_#{user.id}")
    click_on "delete_user_#{user.id}"
    sleep(1)

    sees_success_message(I18n.t('flash.notice.user.destroy'))
    expect(current_path).to eq(users_path)
    expect(page).to have_no_text user.name
    expect(page).to have_no_text user.email
  end

  scenario 'can update an user password' do
    user = create(:user)
    new_password = Faker::Internet.password

    visit edit_user_path(user)
    click_on(I18n.t('users.shared.form.edit_password'))
    expect(current_path).to eq edit_password_user_path(user)

    fill_in('user_password', with: new_password)
    fill_in('user_password_confirmation', with: new_password)
    click_on(I18n.t('users.edit_password.save'))

    sees_success_message(I18n.t('flash.notice.user.update_password'))
    expect(current_path).to eq(users_path)
    valid_password = user.reload.valid_password?(new_password)
    expect(valid_password).to be true
  end

  scenario 'can update an user role' do
    user = create(:admin)

    visit edit_user_path(user)
    click_on(I18n.t('users.shared.form.edit_role'))
    expect(current_path).to eq edit_role_user_path(user)

    select('superadmin', from: 'role_id')
    click_on(I18n.t('users.edit_role.save'))

    sees_success_message(I18n.t('flash.notice.user.update_role'))
    expect(current_path).to eq(users_path)
    user_updated = user.reload
    expect(user_updated.roles.count).to eq(1)
    expect(user_updated.has_role? :superadmin).to be true
  end
end
