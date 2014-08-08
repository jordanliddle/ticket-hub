require 'spec_helper'

feature "Profile page" do
  scenario "viewing" do
    user = FactoryGirl.create(:user)

    visit user_path(user)

    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
  end
end

feature "Editing User" do
  scenario "editing a user" do
    user = FactoryGirl.create(:user)

    visit user_path(user)
    click_link "Edit Profile"

    fill_in "Username", with: "New_Username"
    click_button "Update Profile"

    expect(page).to have_content("User has been updated.")
  end
end

