require "test_helper"

feature "editing an existing post" do
  scenario "changes the already existing post" do
    # Given that there are already posts created (thanks to the yaml fixture)
    sign_in_editor
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: 'Electro House Party!'
    fill_in 'Content', with: 'BOOMBOOMBOOMBOOM'

    # When the user submits the form
    click_on 'Create Post'


    # When a user submits the edit form
    #visit post_path(posts(:sample_post))
    click_on 'Edit'
    fill_in 'Title', with: 'REMIX'
    fill_in 'Content', with: 'Unce unce unce unce'
    click_on 'Update Post'

    # Then the user should see the edited post
    page.text.must_include "editor@example.com"
    page.text.must_include 'REMIX'
    page.text.must_include 'Unce unce unce unce'

  end
end
