require "test_helper"

feature "creating a portfolio item" do
  scenario "a portfolio item is created" do
    # Given that there is a path to submit a portfolio item and a completed form
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "Code Fellows App"
    fill_in "Technologies used", with: "Rails, Ruby, Bootstrap, HTML5, CSS3"

    #When the user clicks create project
    click_on "Create Project"

    #Then the project is successfully added to the database
    page.text.must_include "Project was successfully added"
    page.text.must_include "Code Fellows App"
    page.text.must_include "Rails"
  end
end
