require 'spec_helper'

feature 'signing up' do
  scenario "Successful sign up" do
    visit '/'

    click_link "Sign up"
    fill_in "Email", with: "user@example.com", :match => :prefer_exact
    fill_in "Password", with: "password123", :match => :prefer_exact
    fill_in "Password confirmation", with: "password123", :match => :prefer_exact
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")
  end
end
