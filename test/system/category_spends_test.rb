require "application_system_test_case"

class CategorySpendsTest < ApplicationSystemTestCase
  setup do
    @category_spend = category_spends(:one)
  end

  test "visiting the index" do
    visit category_spends_url
    assert_selector "h1", text: "Category spends"
  end

  test "should create category spend" do
    visit category_spends_url
    click_on "New category spend"

    click_on "Create Category spend"

    assert_text "Category spend was successfully created"
    click_on "Back"
  end

  test "should update Category spend" do
    visit category_spend_url(@category_spend)
    click_on "Edit this category spend", match: :first

    click_on "Update Category spend"

    assert_text "Category spend was successfully updated"
    click_on "Back"
  end

  test "should destroy Category spend" do
    visit category_spend_url(@category_spend)
    click_on "Destroy this category spend", match: :first

    assert_text "Category spend was successfully destroyed"
  end
end
