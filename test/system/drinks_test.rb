require "application_system_test_case"

class DrinksTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
    @drink = drinks(:one)
    # @category = drink_categories(:one)
  end

  test "visiting the index" do
    visit drinks_url
    assert_selector "h1", text: "Drinks"
  end

  test "creating a Drink" do
    visit drinks_url
    click_on "New Drink"

    select 'Beer', from: 'drink[drink_category_id]'
    assert_selector "label", text: "What Brewery?"


    # assert_text "Drink was successfully created"
    # click_on "Back"
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
