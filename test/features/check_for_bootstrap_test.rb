require "test_helper"

feature "checking to see if bootstrap is being used" do
  scenario "shows a pretty framework" do
    visit root_path
    page.body.must_include "navbar-header"
  end
end
