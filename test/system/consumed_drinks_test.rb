require "application_system_test_case"

class ConsumedDrinksTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
    # @consumed_drink = consumed_drinks(:one)
    @drink = drinks(:beer_one)
    @user = users(:one)
    @purchase_size = purchase_sizes(:one)
    sign_in @user
  end


  test "creating a Consumed drink" do
    visit new_consumed_drink_url

    fill_in "drink_search", with: "Beer" 
    click_on "#{@drink.producer.name} - #{@drink.name}"
    assert_selector "option", text: @purchase_size.name

    fill_in "consumed_drink[price_paid]", with: "10.4"

    click_on "Continue", match: :first

    assert_text "Got it."
    assert_text "How did you like #{@drink.name}?"

    assert_selector('div.box', visible: false)
    select 'Ask me later', from: 'consumed_drink[verdict]'
    assert_selector('div.box', visible: true)

    select 'Ask me later', from: 'consumed_drink[amount_consumed]'
    select 'Ask me later', from: 'consumed_drink[next_day_condition]'
    fill_in "consumed_drink[notes]", with: "It was OK"

    click_on "Done", match: :first
    assert_text "Your drinking experience has been saved successfully."
    assert_text "It was OK"
    

  end

  # test "visiting index" do
  #   visit consumed_drinks_url
  #   assert_text "bow"
  # end
end
