require 'spec_helper'

feature "Deleting Project" do
  scenario "Deleting a project" do
    FactoryGirl.create(:project, name: "TextMate 2")

    visit "/"
    first(:link, "TextMate 2").click
    click_link "Delete Project"

    expect(page).to have_content("Project has been destroyed")

    visit "/"

    expect(page).to have_no_content("TextMate 2")
  end
end