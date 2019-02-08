# require "application_system_test_case"

# class ConsumedDrinksTest < ApplicationSystemTestCase
#   setup do
#     @consumed_drink = consumed_drinks(:one)
#   end

#   test "visiting the index" do
#     visit consumed_drinks_url
#     assert_selector "h1", text: "Consumed Drinks"
#   end

#   test "creating a Consumed drink" do
#     visit consumed_drinks_url
#     click_on "New Consumed Drink"

#     fill_in "Amount consumed", with: @consumed_drink.amount_consumed
#     fill_in "Drink", with: @consumed_drink.drink_id
#     fill_in "Next day condition", with: @consumed_drink.next_day_condition
#     fill_in "Price paid", with: @consumed_drink.price_paid
#     fill_in "User", with: @consumed_drink.user_id
#     click_on "Create Consumed drink"

#     assert_text "Consumed drink was successfully created"
#     click_on "Back"
#   end

#   test "updating a Consumed drink" do
#     visit consumed_drinks_url
#     click_on "Edit", match: :first

#     fill_in "Amount consumed", with: @consumed_drink.amount_consumed
#     fill_in "Drink", with: @consumed_drink.drink_id
#     fill_in "Next day condition", with: @consumed_drink.next_day_condition
#     fill_in "Price paid", with: @consumed_drink.price_paid
#     fill_in "User", with: @consumed_drink.user_id
#     click_on "Update Consumed drink"

#     assert_text "Consumed drink was successfully updated"
#     click_on "Back"
#   end

#   test "destroying a Consumed drink" do
#     visit consumed_drinks_url
#     page.accept_confirm do
#       click_on "Destroy", match: :first
#     end

#     assert_text "Consumed drink was successfully destroyed"
#   end
# end
