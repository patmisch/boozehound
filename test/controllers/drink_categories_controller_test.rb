require 'test_helper'

class DrinkCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drink_category = drink_categories(:one)
  end

  test "should get index" do
    get drink_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_drink_category_url
    assert_response :success
  end

  test "should create drink_category" do
    assert_difference('DrinkCategory.count') do
      post drink_categories_url, params: { drink_category: { name: @drink_category.name } }
    end

    assert_redirected_to drink_category_url(DrinkCategory.last)
  end

  test "should show drink_category" do
    get drink_category_url(@drink_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_drink_category_url(@drink_category)
    assert_response :success
  end

  test "should update drink_category" do
    patch drink_category_url(@drink_category), params: { drink_category: { name: @drink_category.name } }
    assert_redirected_to drink_category_url(@drink_category)
  end

  test "should destroy drink_category" do
    assert_difference('DrinkCategory.count', -1) do
      delete drink_category_url(@drink_category)
    end

    assert_redirected_to drink_categories_url
  end
end
