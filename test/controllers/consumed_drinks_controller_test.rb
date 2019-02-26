require 'test_helper'

class ConsumedDrinksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @consumed_drink = consumed_drinks(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get consumed_drinks_url
    assert_response :success
  end

  test "should get new" do
    get new_consumed_drink_url
    assert_response :success
  end

  test "should create consumed_drink" do
    assert_difference('ConsumedDrink.count') do
      post consumed_drinks_url, params: { 
        consumed_drink: 
          { 
            amount_consumed: @consumed_drink.amount_consumed,
            drink_id: @consumed_drink.drink_id,
            next_day_condition: @consumed_drink.next_day_condition,
            price_paid: @consumed_drink.price_paid,
           }
        }
    end

    assert_redirected_to follow_up_consumed_drink_url(ConsumedDrink.last)
  end

  test "should show consumed_drink" do
    get consumed_drink_url(@consumed_drink)
    assert_response :success
  end

  test "should get edit" do
    get edit_consumed_drink_url(@consumed_drink)
    assert_response :success
  end

  test "should update consumed_drink" do
    # patch consumed_drink_url(@consumed_drink), params: { consumed_drink: { amount_consumed: @consumed_drink.amount_consumed, drink_id: @consumed_drink.drink_id, next_day_condition: @consumed_drink.next_day_condition, price_paid: @consumed_drink.price_paid, user_id: @consumed_drink.user_id } }
    # assert_redirected_to consumed_drink_url(@consumed_drink)
  end

  test "should destroy consumed_drink" do
    assert_difference('ConsumedDrink.count', -1) do
      delete consumed_drink_url(@consumed_drink)
    end

    assert_redirected_to consumed_drinks_url
  end
end
