require "test_helper"

feature "not being able to publish a post as an author" do
  scenario "the option to publish is not there" do
    # Given that there are already posts in the post index that are unpublished

    # When an author signs in
    sign_in_author
    visit posts_path

    # Then there should not be a Publish option
    page.wont_have_content "Publish"

  end
end
