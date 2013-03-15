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

feature "new recipe" do
  scenario "requires a name" do
    visit new_recipe_path
    click_on "Create Recipe"
    page.body.downcase.should have_content "name can't be blank"
  end

  scenario "requires that the description be longer than 5 characters" do
    visit new_recipe_path
    click_on "Create Recipe"
    page.body.downcase.should have_content "description is too short"
  end

  it "requires a name, description using client side validation", js: true do
    visit new_recipe_path
    find_field("Name").click
    find_field("Description").click
    page.body.should have_content "can't be blank"
  end
end

