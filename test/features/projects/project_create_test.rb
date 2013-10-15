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

 scenario "new project has invalid data" do
    # Given invalid project data is entered in a form
    visit new_project_path
    fill_in "Name", with: "Q"

    # When the form is submitted with a short name and missing technologies_used field
    click_on "Create Project"

    # Then the form should be displayed again, with an error message
    current_path.must_match /projects$/
    page.text.must_include "prohibited this project from being"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end

end
