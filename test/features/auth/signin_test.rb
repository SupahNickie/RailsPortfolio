require 'test_helper'

feature "signing in as an existing user" do
  scenario "the user is signed in" do
    # Given that an existing user clicks the "sign in" button

    # When a user submits valid credentials
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: users(:editor).email
    fill_in 'Password', with: "password"
    click_on 'Sign in'

    # Then the user should be signed in
    page.text.must_include 'Signed in successfully.'

  end
end
