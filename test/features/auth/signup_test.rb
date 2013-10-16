require 'test_helper'

feature "signing in as a new user" do
  scenario "the new user is created" do
    # Given that a user visits the registration page

    # When a user submits the new user form properly
    visit root_path
    click_on 'Sign Up'
    # NOTE: Fixtures can't work here because they're considered already in the database
    fill_in 'Email', with: "exampleuser@example.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_on 'Sign up'

    # Then the user should be created
    page.text.must_include 'Welcome! You have signed up successfully.'

  end
end
