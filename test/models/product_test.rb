require 'test_helper'

#Loads test data from fixtures/products.yml
class ProductTest < ActiveSupport::TestCase
  test "status_counts.count" do
    assert_equal 3, Product.status_counts.count
  end

  test "status_counts contents" do
    assert_equal 3, Product.status_counts['Deployed']
    assert_equal 1, Product.status_counts['Planned']
    assert_equal 1, Product.status_counts['Released']
    assert_equal nil, Product.status_counts['UnknownStatus']
  end
end
