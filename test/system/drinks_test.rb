require "application_system_test_case"
require "test_helper"

class DrinksTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
  end

  test "visiting the index" do
    visit drinks_url
    assert_selector "h1", text: "Drinks"
  end

  test "visit the show page of drink had multiple times" do
    @user = users(:one)
    sign_in @user
    @drink = drinks(:beer_one)
    visit drink_url(@drink)

    assert_selector "p", text: @drink.name
    assert_selector "p", text: "You usually thought it was Excellent"
  end

  test "visits show page of drink had once" do
    @user = users(:one)
    sign_in @user
    @drink = drinks(:wine_one)
    visit drink_url(@drink)

    assert_selector "p", text: @drink.name
    assert_selector "p", text: "You thought it was Okay"
  end

  test "creating a Drink with existing producer" do
    @user = users(:one)
    sign_in @user
    @producer = producers(:founders)
    @drink_type = drink_types(:ipa)
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

    assert_text "We've added the drink to our database."
    assert_text "What's the Drink?"
    # click_on "Back"
  end

  test "creating a drink with new producer" do
    @user = users(:one)
    sign_in @user
    visit drinks_url
    click_on "New Drink"

    select 'Wine', from: 'drink[drink_category_id]'
    assert_selector "label", text: "What Winery?"

    fill_in "producer_text", with: "New Winery"
    fill_in "drink[name]", with: "Red Blend"
    fill_in "drink_type_text", with: "NE IPA"
    fill_in "drink[abv]", with: "12.3"

    click_on "Save"

    assert_text "We've added the drink to our database."
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
