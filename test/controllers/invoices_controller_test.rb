require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
  test "should get addinvoice" do
    get :addinvoice
    assert_response :success
  end

end
