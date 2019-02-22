require "application_system_test_case"

class DrinksTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
    @drink = drinks(:one)
    @category = drink_categories(:one)
  end

  test "visiting the index" do
    visit drinks_url
    assert_selector "h1", text: "Drinks"
  end

  test "creating a Drink with existing producer" do
    @producer = producers(:one)
    @drink_type = drink_types(:one)
    @drink_type.drink_category = @category
    @drink_type.save
    visit drinks_url
    click_on "New Drink"

    select 'Beer', from: 'drink[drink_category_id]'
    assert_selector "label", text: "What Brewery?"

    fill_in "producer_text", with: "Founders"
    click_on "Founders"
    fill_in "drink[name]", with: "Solid Gold"
    fill_in "drink_type_text", with: "IPA"
    click_on "IPA"
    fill_in "drink[abv]", with: "5.1"

    click_on "Save"

    assert_text "Drink was successfully created"
    assert_text "What's the Drink?"
    # click_on "Back"
  end

  test "creating a drink with new producer" do
    visit drinks_url
    click_on "New Drink"

    select 'Wine', from: 'drink[drink_category_id]'
    assert_selector "label", text: "What Winery?"

    fill_in "producer_text", with: "New Winery"
    fill_in "drink[name]", with: "Red Blend"
    fill_in "drink_type_text", with: "NE IPA"
    fill_in "drink[abv]", with: "12.3"

    click_on "Save"

    assert_text "Drink was successfully created"
    assert_text "What's the Drink?"
  end

  test "destroying a Drink as non user" do
    visit drinks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Permissions denied"
  end

  test "destroying a Drink as user" do
    @user = users(:one)
    sign_in @user
    visit drinks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Permissions denied"
  end

  test "destroying a Drink as admin" do
    @user = users(:admin)
    sign_in @user
    visit drinks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Drink was successfully destroyed"
  end
end
