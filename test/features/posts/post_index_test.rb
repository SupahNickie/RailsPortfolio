require "test_helper"

feature "visiting the post index page" do
  scenario "shows all the posts" do
    # Given that there are posts already created (thanks to the yaml fixture)

    # When the user visits the post index
    visit posts_path

    # Then the user should see all the posts
    page.text.must_include "Techno party"
    page.text.must_include "Boots and cats and boots and cats"

  end
end
