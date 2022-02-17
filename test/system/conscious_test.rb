require "application_system_test_case"

class ConsciousTest < ApplicationSystemTestCase
  setup do
    @consciou = conscious(:one)
  end

  test "visiting the index" do
    visit conscious_url
    assert_selector "h1", text: "Conscious"
  end

  test "creating a Consciou" do
    visit conscious_url
    click_on "New Consciou"

    click_on "Create Consciou"

    assert_text "Consciou was successfully created"
    click_on "Back"
  end

  test "updating a Consciou" do
    visit conscious_url
    click_on "Edit", match: :first

    click_on "Update Consciou"

    assert_text "Consciou was successfully updated"
    click_on "Back"
  end

  test "destroying a Consciou" do
    visit conscious_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Consciou was successfully destroyed"
  end
end
