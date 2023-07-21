require "test_helper"

class CategorySpendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_spend = category_spends(:one)
  end

  test "should get index" do
    get category_spends_url
    assert_response :success
  end

  test "should get new" do
    get new_category_spend_url
    assert_response :success
  end

  test "should create category_spend" do
    assert_difference("CategorySpend.count") do
      post category_spends_url, params: { category_spend: {  } }
    end

    assert_redirected_to category_spend_url(CategorySpend.last)
  end

  test "should show category_spend" do
    get category_spend_url(@category_spend)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_spend_url(@category_spend)
    assert_response :success
  end

  test "should update category_spend" do
    patch category_spend_url(@category_spend), params: { category_spend: {  } }
    assert_redirected_to category_spend_url(@category_spend)
  end

  test "should destroy category_spend" do
    assert_difference("CategorySpend.count", -1) do
      delete category_spend_url(@category_spend)
    end

    assert_redirected_to category_spends_url
  end
end
