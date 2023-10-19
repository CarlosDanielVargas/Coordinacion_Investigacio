require "application_system_test_case"

class InvestigatorsTest < ApplicationSystemTestCase
  setup do
    @individual = investigators(:one)
  end

  test "visiting the index" do
    visit investigators_url
    assert_selector "h1", text: "Investigators"
  end

  test "should create individual" do
    visit investigators_url
    click_on "New individual"

    fill_in "Email", with: @individual.email
    fill_in "First name", with: @individual.first_name
    fill_in "Id card", with: @individual.id_card
    fill_in "Last name", with: @individual.last_name
    click_on "Create Individual"

    assert_text "Individual was successfully created"
    click_on "Back"
  end

  test "should update Individual" do
    visit investigator_url(@individual)
    click_on "Edit this individual", match: :first

    fill_in "Email", with: @individual.email
    fill_in "First name", with: @individual.first_name
    fill_in "Id card", with: @individual.id_card
    fill_in "Last name", with: @individual.last_name
    click_on "Update Individual"

    assert_text "Individual was successfully updated"
    click_on "Back"
  end

  test "should destroy Individual" do
    visit investigator_url(@individual)
    click_on "Destroy this individual", match: :first

    assert_text "Individual was successfully destroyed"
  end
end
