require "application_system_test_case"

class ConsumedDrinksTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
    # @consumed_drink = consumed_drinks(:one)
    @drink_category = drink_categories(:one)
    @purchase_size = purchase_sizes(:one)
    @producer = producers(:one)
    @purchase_size.drink_category = @drink_category
    @purchase_size.save
    @drink = drinks(:one)
    @drink.drink_category = @drink_category
    @drink.producer = @producer
    @drink.save
    @user = users(:one)
    sign_in @user
  end


  test "creating a Consumed drink" do
    visit new_consumed_drink_url

    fill_in "drink_search", with: "MyStrin" 
    click_on "#{@drink.producer.name} - #{@drink.name}"
    assert_selector "option", text: @purchase_size.name

    fill_in "consumed_drink[price_paid]", with: "10.4"

    click_on "Continue", match: :first

    assert_text "Consumed drink was successfully created"
    assert_text "How did you like #{@drink.name}?"

    assert_selector('div.box', visible: false)
    select 'Ask me later', from: 'consumed_drink[verdict]'
    assert_selector('div.box', visible: true)
    

  end


  test "destroying a Consumed drink" do
    visit consumed_drinks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Consumed drink was successfully destroyed"
  end
end
