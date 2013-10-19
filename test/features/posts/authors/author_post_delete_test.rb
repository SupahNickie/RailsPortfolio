require "test_helper"

feature "destroying a post as an author" do
  scenario "deletes the drunken rant" do
    # Given that there are already posts in the post index

    # When the author clicks destroy on his own post while on the post index page
    sign_in_author
    visit posts_path
    page.find("div#post_#{posts(:sample_post_2).id}").click_on "Destroy Post"

    # Then the post is deleted if the author clicks "OK" on the confirmation box
    page.wont_have_content "Awwyeah"
    page.wont_have_content "This is another post"

  end
end
