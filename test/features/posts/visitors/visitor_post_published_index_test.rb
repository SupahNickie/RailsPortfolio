require "test_helper"

feature "visiting the post index page as an unregistered user" do
  scenario "shows only published posts" do
    # Given that there are posts already created

    # When a site visitor visits the post index
    visit posts_path

    # Then the visitor should only see all the posts that are published
    page.text.must_include "Techno party"
    page.wont_have_content "Awwyeah"

  end
end
