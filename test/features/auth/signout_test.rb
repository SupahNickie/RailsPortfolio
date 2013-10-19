require 'test_helper'

feature "signing out as an existing user" do
  scenario "the user's session is destroyed" do
    # Given that a new user is signed in
    visit new_user_session_path
    fill_in 'Email', with: users(:editor).email
    fill_in 'Password', with: "password"
    click_on 'Sign in'

    # When a user clicks on "sign out"
    click_on 'Sign Out'

    # Then the session should be destroyed
    page.text.must_include 'Signed out successfully.'

  end
end
