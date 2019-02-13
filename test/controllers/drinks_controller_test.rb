require 'test_helper'

class DrinksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @producer = producers(:one)
    @categories = [drink_categories(:one)]
    @drink = drinks(:one)
    @drink.producer = @producer
    @drink.drink_category = @categories.first
    @user = users(:one)

    @user.admin = true
    sign_in @user
  end

  test "should get index" do
    get drinks_url
    assert_response :success
  end

  test "should get new" do
    get new_drink_url
    assert_response :success
  end

  test "should create drink" do
    assert_difference('Drink.count') do
      post drinks_url, params: { drink: { abv: @drink.abv, drink_category_id: @drink.drink_category_id, name: @drink.name, producer_id: @drink.producer_id } }
    end

    assert_redirected_to new_consumed_drink_url(drink_id: @drink.id + 1)
  end

  test "should show drink" do
    get drink_url(@drink)
    assert_response :success
  end

  test "should get edit" do
    get edit_drink_url(@drink)
    assert_response :success
  end

  test "should destroy drink" do
    assert_difference('Drink.count', -1) do
      delete drink_url(@drink)
    end

    assert_redirected_to drinks_url
  end
end
