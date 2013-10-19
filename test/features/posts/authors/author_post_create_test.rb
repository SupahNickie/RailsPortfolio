require "test_helper"

feature "creating a post as an author" do
  scenario "works with valid data" do
    # Given that a completed post form
    sign_in_author
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: 'a new hope yay'
    fill_in 'Content', with: 'a long time ago in a galaxy far far away'

    # When the authorized author submits the form
    click_on 'Create Post'

    # Then the author should see the new post and a success message
    page.text.must_include 'a new hope yay'
    page.text.must_include 'a long time ago in a galaxy far far away'
    page.text.must_include 'Post was successfully created'
    page.has_css? "#author"
    page.text.must_include "author@example.com"

  end
end
