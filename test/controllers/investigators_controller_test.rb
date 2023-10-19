require "test_helper"

class InvestigatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @individual = investigators(:one)
  end

  test "should get index" do
    get investigators_url
    assert_response :success
  end

  test "should get new" do
    get new_investigator_url
    assert_response :success
  end

  test "should create individual" do
    assert_difference("Individual.count") do
      post investigators_url, params: { individual: { email: @individual.email, first_name: @individual.first_name, id_card: @individual.id_card, last_name: @individual.last_name } }
    end

    assert_redirected_to investigator_url(Individual.last)
  end

  test "should show individual" do
    get investigator_url(@individual)
    assert_response :success
  end

  test "should get edit" do
    get edit_investigator_url(@individual)
    assert_response :success
  end

  test "should update individual" do
    patch investigator_url(@individual), params: { individual: { email: @individual.email, first_name: @individual.first_name, id_card: @individual.id_card, last_name: @individual.last_name } }
    assert_redirected_to investigator_url(@individual)
  end

  test "should destroy individual" do
    assert_difference("Individual.count", -1) do
      delete investigator_url(@individual)
    end

    assert_redirected_to investigators_url
  end
end
