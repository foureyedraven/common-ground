require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get math" do
    get static_pages_math_url
    assert_response :success
  end

  test "should get study-guides" do
    get static_pages_study-guides_url
    assert_response :success
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
  end

  test "should get long-reads" do
    get static_pages_long-reads_url
    assert_response :success
  end

end
