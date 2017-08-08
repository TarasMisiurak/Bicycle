require 'test_helper'

class ManagePanelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manage_panel_index_url
    assert_response :success
  end

end
