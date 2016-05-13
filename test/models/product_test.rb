require 'test_helper'

# Note: Loads test data from fixtures/products.yml
class ProductTest < ActiveSupport::TestCase
  test 'should not save without title' do
    product = Product.new(status: 'Planned')
    assert_not product.save
  end

  test 'should not save without status' do
    product = Product.new(title: 'Product 1')
    assert_not product.save
  end

  test 'can save when required fields are present' do
    product = Product.new(title: 'Product 1', status: 'Planned')
    assert product.save
  end

  test 'status_counts.count' do
    assert_equal 3, Product.status_counts.count
  end

  test 'status_counts contents' do
    assert_equal 3, Product.status_counts['Deployed']
    assert_equal 1, Product.status_counts['Planned']
    assert_equal 1, Product.status_counts['Released']
    assert_equal nil, Product.status_counts['UnknownStatus']
  end
end
