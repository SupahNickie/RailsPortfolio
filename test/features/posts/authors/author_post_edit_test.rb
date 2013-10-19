require "test_helper"

feature "editing an existing post as an author" do
  scenario "changes the already existing post" do
    # Given that there are already posts created

    # When the author submits the form
    sign_in_author
    visit posts_path
    page.find("div#post_#{posts(:sample_post_2).id}").click_on "Edit Post"
    fill_in 'Title', with: 'REMIX'
    fill_in 'Content', with: 'Unce unce unce unce'
    click_on 'Update Post'

    # Then the editor should see the edited post
    page.text.must_include 'REMIX'
    page.text.must_include 'Unce unce unce unce'

  end
end
