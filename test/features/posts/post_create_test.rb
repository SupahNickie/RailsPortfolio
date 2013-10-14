require "test_helper"

feature "creating a post" do
  scenario "works with valid data" do
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

  end
end
