require "test_helper"

feature "visitor posting new comments" do
  scenario "visitor can post comments if they're signed in" do
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

  end
end
