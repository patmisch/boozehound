require "application_system_test_case"

class DrinkCategoriesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
    @drink_category = drink_categories(:beer)
    @user = users(:admin)
    sign_in @user
  end

  test "visiting the index" do
    visit drink_categories_url
    assert_selector "h1", text: "Drink Categories"
  end

  test "creating a Drink category" do
    visit drink_categories_url
    click_on "New Drink Category"

    fill_in "Name", with: @drink_category.name
    click_on "Create Drink category"

    assert_text "Drink category was successfully created"
    click_on "Back"
  end

  test "updating a Drink category" do
    visit drink_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @drink_category.name
    click_on "Update Drink category"

    assert_text "Drink category was successfully updated"
    click_on "Back"
  end

  test "destroying a Drink category" do
    visit drink_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Drink category was successfully destroyed"
  end
end
