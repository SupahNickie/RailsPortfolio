require "test_helper"

feature "visiting the post index page as an unregistered user" do
  scenario "shows only published posts" do
    # Given that there are posts already created

    # When a site visitor visits the post index
    visit posts_path

    # Then the visitor should only see all the posts that are published
    page.text.must_include "Techno party"
    page.text.must_include "Boots and cats and boots and cats"
    page.wont_have_content "Awwyeah"
    page.wont_have_content "This is another post"

  end
end
