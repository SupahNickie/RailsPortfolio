require "test_helper"

feature "editing an existing project" do
  scenario "the project gets edited" do
    sign_in_editor
    #Given that a project exists in the database

    #When a user vists the project's page and submits an edited version of the project
    visit project_path(projects(:sample_project))
    click_on 'Edit'
    fill_in 'Name', with: 'A different Rails App'
    fill_in 'Technologies used', with: 'Coolness, know-how'
    click_on 'Update Project'

    #Then the user should see the edited post
    page.must_have_content 'A different Rails App'
    page.wont_have_content 'Code Fellows App'
  end

   scenario "incorrectly editing an existing project" do
    sign_in_editor
    # Given an existing project

    # When I submit invalid changes
    visit project_path(projects(:sample_project))
    click_on 'Edit'
    fill_in 'Name', with: 'Q'
    click_on 'Update Project'

    # Then the changes should not be saved, and I should get to try again
    page.text.must_include 'prohibited this project from being'
    page.text.must_include 'Name is too short'

  end

end
