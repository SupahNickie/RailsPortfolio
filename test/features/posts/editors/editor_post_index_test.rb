require "test_helper"

feature "visiting the post index page" do
  scenario "shows all the posts" do
    # Given that there are posts already created (thanks to the yaml fixture)

    # When the editor visits the post index
    sign_in_editor
    visit posts_path

    # Then the user should see all the posts
    page.text.must_include "Techno party" && "Awwyeah"
    page.text.must_include "Boots and cats and boots and cats" && "This is another post"

  end
end
