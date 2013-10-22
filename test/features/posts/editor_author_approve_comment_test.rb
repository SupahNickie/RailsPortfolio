require "test_helper"

feature "editor or author approving new comments" do
  scenario "submitted comments from other users are approved and visible" do
    # Given that there are posts already created

    # When a signed-in site visitor visits a specific post
    sign_in_visitor
    visit posts_path
    page.find("div#post_#{posts(:sample_post).id}").click_on "View Post"

    # Then the visitor should be allowed to submit comments on posts subject to moderation
    fill_in "Your name", with: "#{users(:visitor).name}"
    fill_in "Your email", with: "#{users(:visitor).email}"
    fill_in "Your Comment", with: "This is a comment"
    click_on "Submit comment for approval"

    # Then when the editor or author signs in
    click_on "Sign Out"
    sign_in_editor

    # And the editor visits the same page the comment was submitted to
    visit posts_path
    page.find("div#post_#{posts(:sample_post).id}").click_on "View Post"

    # The editor should be able to view all comments and approve the ones that aren't trash

  end
end
