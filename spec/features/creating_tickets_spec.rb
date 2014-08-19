require 'spec_helper'

feature "Creating tickets" do

  before do
    project = FactoryGirl.create(:project)
    user = FactoryGirl.create(:user)
    define_permission!(user, "view", project)
    @email = user.email
    sign_in_as!(user)

    visit '/'
    click_link project.name
    click_link "New Ticket"
  end

  scenario "Creating a ticket" do
    fill_in "Title", with: "Non-standards compliance"
    fill_in "Description", with: "My pages are damn ugly!"
    click_button "Create Ticket"

    expect(page).to have_content("Hey, good news! Your ticket has been created.")

    within "#ticket #author" do
      expect(page).to have_content("Created by #{@email}")
    end
  end

  scenario "Creating a ticket without valid attributes fails" do
    click_button "Create Ticket"

    expect(page).to have_content("Whoops, something went wrong, ticket not created.")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario "Description must be longer than 10 characters" do
    fill_in "Title", with: "Non-standards compliance"
    fill_in "Description", with: ""
    click_button "Create Ticket"

    expect(page).to have_content("Whoops, something went wrong, ticket not created.")
    expect(page).to have_content("Description is too short")
  end

end
