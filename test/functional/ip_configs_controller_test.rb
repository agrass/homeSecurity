require 'test_helper'

class IpConfigsControllerTest < ActionController::TestCase
  setup do
    @ip_config = ip_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ip_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ip_config" do
    assert_difference('IpConfig.count') do
      post :create, ip_config: { ip: @ip_config.ip }
    end

    assert_redirected_to ip_config_path(assigns(:ip_config))
  end

  test "should show ip_config" do
    get :show, id: @ip_config
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ip_config
    assert_response :success
  end

  test "should update ip_config" do
    put :update, id: @ip_config, ip_config: { ip: @ip_config.ip }
    assert_redirected_to ip_config_path(assigns(:ip_config))
  end

  test "should destroy ip_config" do
    assert_difference('IpConfig.count', -1) do
      delete :destroy, id: @ip_config
    end

    assert_redirected_to ip_configs_path
  end
end
