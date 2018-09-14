require 'test_helper'

# rails test test/controllers/products_controller_test.rb

class ProductsControllerTest < ActionDispatch::IntegrationTest
  
  # test 'get index: is successful' do
  #   get products_path
  #   assert_response :success
  # end


  test 'post create: creates a product' do
    sign_in users(:ash)
    assert_difference 'Product.count', 1 do
      post products_path, params: { product: { name: 'product 1', price: 2, published: true, cost: 1.3, stock: 2 } }
    end
  end

  test " is redirected to login if user is not authenticated" do
    get products_path
    assert_response :redirect
  end

  test "get index is successful if user is authenticated" do
    sign_in users(:ash)
    get products_path
    assert_response :success
  end

end
