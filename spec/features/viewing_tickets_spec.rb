require 'spec_helper'

feature "viewing tickets" do
  before do
    factory_example = FactoryGirl.create(:project, name: "example2")

    user = FactoryGirl.create(:user)
    ticket = FactoryGirl.create(:ticket,
            project: factory_example,
            title: "Make it shiny!",
            description: "Gradients! Starbursts, Oh my!")
    ticket.update(user: user) # same as ticket.user = user </br> ticket.save


    visit '/'
  end

  scenario "Viewing tickets for a given project" do
    first(:link, "example2").click

    expect(page).to have_content("Make it shiny!")
    expect(page).to_not have_content("Standards compliance")

    click_link "Make it shiny!"
    within("#ticket h2") do 
      expect(page).to have_content("Make it shiny!")
    end

    expect(page).to have_content("Gradients! Starbursts, Oh my!")
  end
end
