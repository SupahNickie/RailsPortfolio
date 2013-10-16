require "test_helper"

feature "creating a post" do
  scenario "works with valid data" do
    visit root_path
    click_on 'Sign Up'
    # NOTE: Fixtures can't work here because they're considered already in the database
    fill_in 'Email', with: "exampleuser@example.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_on 'Sign up'

    # Given that a completed post form
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: 'a new hope yay'
    fill_in 'Content', with: 'a long time ago in a galaxy far far away'

    # When the user submits the form
    click_on 'Create Post'

    # Then the user should see the new post and a success message
    page.text.must_include 'a new hope yay'
    page.text.must_include 'a long time ago in a galaxy far far away'
    page.text.must_include 'Post was successfully created'
    page.has_css? "#author"
    page.text.must_include "exampleuser@example.com"

  end
end
