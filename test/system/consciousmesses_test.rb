require "application_system_test_case"

class ConsciousmessesTest < ApplicationSystemTestCase
  setup do
    @consciousmess = consciousmesses(:one)
  end

  test "visiting the index" do
    visit consciousmesses_url
    assert_selector "h1", text: "Consciousmesses"
  end

  test "creating a Consciousmess" do
    visit consciousmesses_url
    click_on "New Consciousmess"

    click_on "Create Consciousmess"

    assert_text "Consciousmess was successfully created"
    click_on "Back"
  end

  test "updating a Consciousmess" do
    visit consciousmesses_url
    click_on "Edit", match: :first

    click_on "Update Consciousmess"

    assert_text "Consciousmess was successfully updated"
    click_on "Back"
  end

  test "destroying a Consciousmess" do
    visit consciousmesses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Consciousmess was successfully destroyed"
  end
end
