require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @update = {
      :title        => 'Lorem Ibsom',
      :description  => 'This is a description',
      :image_url    => 'lorem.jpg',
      :price        => 19.95
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, :product => @update
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, :id => @product.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @product.to_param
    assert_response :success
    assert_select '#main h1', 'Editing product'
  end

  test "should update product" do
    put :update, :id => @product.to_param, :product => @update
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, :id => @product.to_param
    end

    assert_redirected_to products_path
  end
  
  test "should show products" do
    get :index
    assert_response :success
    assert_select '#main #product_list h1', 'Listing products'
  end

end
