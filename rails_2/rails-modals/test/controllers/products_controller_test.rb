require 'test_helper'

# rails test test/controllers/products_controller_test.rb

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'get index: is successful' do
    get products_path
    assert_response :success
  end

  test 'post create: creates a product' do
    assert_difference 'Product.count', 1 do
      post products_path, params: { product: { name: 'product 1', price: 2, published: true, cost: 1.3, stock: 2 } }
    end
  end
end
