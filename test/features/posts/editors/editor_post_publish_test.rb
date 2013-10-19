require "test_helper"

feature "publishing a post" do
  scenario "the post gets published and appears visible to all unsigned users" do
    # Given that there are already posts in the post index that are unpublished

    # When an editor clicks publish while on the post index page
    sign_in_editor
    visit posts_path
    page.find("div#post_#{posts(:sample_post_2).id}").click_on "Publish"
    click_on "Back"

    # Then the post is published
    visit posts_path
    page.wont_have_content "Publish"
    page.text.must_include "Awwyeah"
    page.text.must_include "This is another post"

  end
end
