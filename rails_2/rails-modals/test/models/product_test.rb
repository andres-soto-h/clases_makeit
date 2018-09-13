require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup; end

  test 'Product is not created without a name' do
    product = Product.new
    assert_equal false, product.save
  end

  test '.word_count returns the correct number of words in name' do
    product = Product.new(name: 'hola mundo. Esto es una prueba!')
    assert_equal 6, product.word_count
  end

  test 'published scope only returns published Products' do
    products = Product.published
    assert_equal 2, products.length
  end

  test 'get product profit' do
    product = Product.first
    assert_equal '100.0%', product.profit
  end

  test 'check if product is available in stock' do
    product = Product.last
    assert_equal true, product.stock_status
  end
end
