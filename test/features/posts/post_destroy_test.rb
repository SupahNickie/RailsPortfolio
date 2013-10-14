require "test_helper"

feature "destroying a post" do
  scenario "deletes the drunken rant" do
    # Given that there are already posts in the post index (thanks to the yaml fixture)


    # When a user clicks destroy while on the post index page
    visit posts_path
    page.find("div#post_#{posts(:sample_post).id}").click_on "Destroy Post"

    # Then the post is deleted if the user clicks "OK" on the confirmation box
    page.wont_have_content "Techno party"
    page.wont_have_content "Boots and cats and boots and cats"

  end
end
