require 'rails_helper'
RSpec.describe 'Categories and spend', type: :feature do
  include Devise::Test::IntegrationHelpers
  let!(:user) do
    User.create({ name: 'User one', email: 'user1@example.com', password: 'password' })
  end
  before do
    sign_in user
    visit new_category_path
    fill_in "Name", with: "Test Category1"
    attach_file("Upload Icon File", Rails.root.join('app', 'assets', 'icon', 'test1.png'))
    click_button "Save"
    visit new_category_path
    fill_in "Name", with: "Test Category2"
    attach_file("Upload Icon File", Rails.root.join('app', 'assets', 'icon', 'test1.png'))
    click_button "Save"
  end
  scenario "User can create a new category" do
    visit new_category_path

    # Fill in the form fields with valid data
    fill_in "Name", with: "Test Category3"

    # Attach a test image file for the icon field
    attach_file("Upload Icon File", Rails.root.join('app', 'assets', 'icon', 'test1.png'))

    # Submit the form
    click_button "Save"

    # Assert that the category was successfully created
    expect(page).to have_content("Test Category3")
  end
  scenario "User cannot create a new category with invalid data" do
    # Submit the form without filling in the required fields
    visit new_category_path

    click_button "Save"

    # Assert that the form shows the error messages for the required fields
    expect(page).to have_content("prohibited this category from being saved:")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Icon can't be blank")
  end
  scenario "shows users category names and icons" do
    # Assert that the category was successfully created
    categories = user.categories
    categories.each do |category|
      expect(page).to have_content(category.name)
      expect(page).to have_css('img')
    end
  end
  scenario "redirects into transaction page clicking on category" do
    # Assert that the category was successfully created
    category = user.categories.first
    click_on category.name
    assert_current_path category_spends_path(category)
  end
  scenario "User can create a new spend" do
    category = user.categories.first
    click_on category.name
    click_on "New"

    fill_in "Name", with: "Test Spend1"
    fill_in "Amount", with: "300"
    click_button "Save"

    expect(page).to have_content("Test Spend1")
  end
end




