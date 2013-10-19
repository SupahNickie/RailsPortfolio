require "test_helper"

feature "visitor failing at CUD options" do
  scenario "visitor can view posts, minus options to Create, Update, and Destroy" do
    # Given that there are posts already created

    # When a site visitor visits the post index
    visit posts_path

    # Then the visitor should only be allowed to view posts, not create, update, destroy, or publish any
    page.text.must_include "Techno party"
    page.text.must_include "Boots and cats and boots and cats"
    page.wont_have_content "Awwyeah"
    page.wont_have_content "This is another post"

    page.wont_have_content "Edit Post"
    page.wont_have_content "Destroy Post"
    page.wont_have_content "Publish"

  end
end
