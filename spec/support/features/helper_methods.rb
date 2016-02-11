module Features
  module HelperMethods
    def given_logged_in_as(user)
      visit "/users/sign_in"
      fill_in('Email', with: user.email)
      fill_in('Password', with: user.password)
      click_on("Log in")
    end

    def sees_success_message(message)
      within(".alert") do
        expect(page).to have_text(message)
      end
    end
  end
end
