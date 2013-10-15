require "test_helper"

feature "visiting the projects page" do
  scenario "all projects are listed" do
    #Given that a project exists in the database

    #When a user vists the project index page
    visit projects_path

    #Then the user should see all the projects
    page.must_have_content 'Sound Sleep Website'
    page.must_have_content 'Code Fellows App'
    page.wont_have_content 'Code Fellows SUCKS'
  end

end
