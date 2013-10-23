require "test_helper"

feature "visitor posting new comments on a project" do
  scenario "visitor can post comments if they're signed in" do
    # Given that there are projects already created

    # When a signed-in site visitor visits a specific project
    sign_in_visitor
    visit projects_path
    page.find("div#project_#{projects(:sample_project).id}").click_on "View Project"

    # Then the visitor should be allowed to submit comments on projects subject to moderation
    fill_in "Your name", with: "#{comments(:sample2).author}"
    fill_in "Your email", with: "#{comments(:sample2).author_email}"
    fill_in "Your URL", with: "#{comments(:sample2).author_url}"
    fill_in "Your Comment", with: "#{comments(:sample2).content}"
    click_on "Submit comment for approval"

  end
end
