require "application_system_test_case"

class TransactionsTest < ApplicationSystemTestCase
  setup do
    @transaction = transactions(:one)
  end

  test "visiting the index" do
    visit transactions_url
    assert_selector "h1", text: "Transactions"
  end

  test "should create transaction" do
    visit transactions_url
    click_on "New transaction"

    fill_in "Agreementnumber", with: @transaction.agreementNumber
    fill_in "Status", with: @transaction.status
    click_on "Create Process"

    assert_text "Process was successfully created"
    click_on "Back"
  end

  test "should update Process" do
    visit transaction_url(@transaction)
    click_on "Edit this transaction", match: :first

    fill_in "Agreementnumber", with: @transaction.agreementNumber
    fill_in "Status", with: @transaction.status
    click_on "Update Process"

    assert_text "Process was successfully updated"
    click_on "Back"
  end

  test "should destroy Process" do
    visit transaction_url(@transaction)
    click_on "Destroy this transaction", match: :first

    assert_text "Process was successfully destroyed"
  end
end
