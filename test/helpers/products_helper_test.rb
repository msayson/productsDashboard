require 'test_helper'

# Tests for ProductsHelper
class ProductsHelperTest < ActionController::TestCase
  test 'next_sort_dir defaults to asc if no sorted_col parameter' do
    assert_equal 'asc', ProductsHelper.next_sort_dir('title', nil, nil)
  end

  test 'next_sort_dir defaults to asc if no curr_sort_dir parameter' do
    assert_equal 'asc', ProductsHelper.next_sort_dir('status', 'status', nil)
  end

  test 'next_sort_dir defaults to asc if column is not sorted_col' do
    assert_equal 'asc', ProductsHelper.next_sort_dir('title', 'status', 'desc')
  end

  test 'next_sort_dir gives opposite of curr_sort_dir if column is sort_col' do
    assert_equal 'asc', ProductsHelper.next_sort_dir('status', 'status', 'desc')
    assert_equal 'desc', ProductsHelper.next_sort_dir('status', 'status', 'asc')
  end
end
