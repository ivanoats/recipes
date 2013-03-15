require 'spec_helper'

feature "home page" do
  scenario "displays a list of recipes" do
    recipe = FactoryGirl.create(:recipe, name: "greens and beans")
    recipe2 = FactoryGirl.create(:recipe, name: "surf and turf")

    visit "/"

    page.should have_content("greens and beans")
    page.should have_content("surf and turf")
  end
end
