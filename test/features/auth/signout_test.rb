require 'test_helper'

feature "signing out as an existing user" do
  scenario "the user's session is destroyed" do
    # Given that a new user is signed in
    visit root_path
    click_on 'Sign Up'
    fill_in 'Email', with: "exampleuser@example.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_on 'Sign up'

    # When a user clicks on "sign out"
    click_on 'Sign Out'

    # Then the session should be destroyed
    page.text.must_include 'Signed out successfully.'

  end
end
