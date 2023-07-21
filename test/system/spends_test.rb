require "application_system_test_case"

class SpendsTest < ApplicationSystemTestCase
  setup do
    @spend = spends(:one)
  end

  test "visiting the index" do
    visit spends_url
    assert_selector "h1", text: "Spends"
  end

  test "should create spend" do
    visit spends_url
    click_on "New spend"

    click_on "Create Spend"

    assert_text "Spend was successfully created"
    click_on "Back"
  end

  test "should update Spend" do
    visit spend_url(@spend)
    click_on "Edit this spend", match: :first

    click_on "Update Spend"

    assert_text "Spend was successfully updated"
    click_on "Back"
  end

  test "should destroy Spend" do
    visit spend_url(@spend)
    click_on "Destroy this spend", match: :first

    assert_text "Spend was successfully destroyed"
  end
end
