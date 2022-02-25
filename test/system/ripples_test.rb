require "application_system_test_case"

class RipplesTest < ApplicationSystemTestCase
  setup do
    @ripple = ripples(:one)
  end

  test "visiting the index" do
    visit ripples_url
    assert_selector "h1", text: "Ripples"
  end

  test "creating a Ripple" do
    visit ripples_url
    click_on "New Ripple"

    fill_in "Message", with: @ripple.message
    fill_in "Name", with: @ripple.name
    #fill_in "Posted", with: @ripple.posted
    fill_in "Url", with: @ripple.url
    click_on "Create Ripple"

    assert_text "Ripple was successfully created"
    #click_on "Back"
  end

  #test "updating a Ripple" do
  #  visit ripples_url
  #  click_on "Edit", match: :first

  #  fill_in "Message", with: @ripple.message
  #  fill_in "Name", with: @ripple.name
  #  fill_in "Posted", with: @ripple.posted
  #  fill_in "Url", with: @ripple.url
  #  click_on "Update Ripple"

  #  assert_text "Ripple was successfully updated"
  #  click_on "Back"
  #end

  #test "destroying a Ripple" do
  #  visit ripples_url
  #  page.accept_confirm do
  #    click_on "Destroy", match: :first
  #  end

  #  assert_text "Ripple was successfully destroyed"
  #end

  test "moving forward and backward" do
    visit ripples_url
    click_on "Next 10"
    assert_selector "h1", text: "Ripples"
    assert_equal session[:offset].to_s.to_i, 10
    click_on "Next 10"
    assert_equal session[:offset].to_s.to_i, 20
    click_on "Previous 10"
    assert_equal session[:offset].to_s.to_i, 10
    click_on "Next 10"
    assert_equal session[:offset].to_s.to_i, 20
    click_on "Next 10"
    assert_equal session[:offset].to_s.to_i, 30
    click_on "Previous 10"
    assert_equal session[:offset].to_s.to_i, 20
    click_on "Previous 10"
    assert_equal session[:offset].to_s.to_i, 10
    click_on "Previous 10"
    assert_equal session[:offset].to_s.to_i, 0
  end

  test "can move to oldest and newest" do
    visit ripples_url
    click_on "Oldest"
    click_on "Newest"
    #assert_equal "index", @controller.action_name
    assert_equal session[:offset].to_s.to_i, 0
  end

  test "does not move below minimum" do
    visit ripples_url
    click_on "Previous 10"
    assert_equal session[:offset].to_s.to_i, 0
  end

  test "does not move above maximum" do
    visit ripples_url
    click_on "Oldest"
    @session = session[:offset].to_s.to_i
    click_on "Next 10"
    assert_equal session[:offset].to_s.to_i, @session
  end
end
