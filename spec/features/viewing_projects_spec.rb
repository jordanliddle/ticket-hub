require 'spec_helper'

feature "Viewing projects" do
  scenario "Listing all projects" do
    project = FactoryGirl.create(:project, name: "Example")
    visit '/'
    first(:link, 'Example').click
    expect(page.current_url).to eql(project_url(project))
  end
end