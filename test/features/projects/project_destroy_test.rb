require "test_helper"

feature "destroying a project post" do
  scenario "the project item goes byebye" do
    sign_in_editor
    # Given that there are already posts in the post index (thanks to the yaml fixture)

    # When a user clicks destroy while on the projects index page
    visit projects_path
    page.find("div#project_#{projects(:sample_project).id}").click_on "Destroy Project"

    # Then the post is deleted if the user clicks "OK" on the confirmation box
    page.wont_have_content "Code Fellows App"
    page.wont_have_content "Rails"

  end
end
