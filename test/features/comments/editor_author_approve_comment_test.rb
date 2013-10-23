require "test_helper"

feature "editor or author approving new comments and deleting comments" do
  scenario "submitted comments from other users are approved and visible" do
    # Given that there are comments already created

    # And the post's author visits the same page the comment was submitted to
    sign_in_author
    visit posts_path
    page.find("div#post_#{posts(:sample_post_3).id}").click_on "View Post"

    # The author should be able to view all comments and approve the ones that aren't trash
    click_on "Publish Comment"
    assert(comments(:sample2).approved?, msg = "The test fails if the post comment is not approved")
    page.wont_have_content "Publish Comment"
  end

  scenario "an editor can see and approve comments their projects" do
    # Given that there are comments already created

    # When an editor visits the page of a project post they wrote
    sign_in_editor
    visit projects_path
    page.find("div#project_#{projects(:sample_project).id}").click_on "View Project"

    # Then they should be able to approve and delete comments
    click_on "Publish Comment"
    assert(comments(:sample4).approved?, msg = "The test fails if the project comment is not approved")
    page.wont_have_content "Publish Comment"
  end

end
