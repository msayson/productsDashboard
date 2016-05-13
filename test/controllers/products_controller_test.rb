require 'test_helper'

# Tests for ProductController actions and other methods
class ProductsControllerTest < ActionController::TestCase
  # Test can get all pages
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get show if product exists' do
    Product.create(id: 1, title: 'Product1', status: 'JIRA')
    get :show, id: 1
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  # Test create action renders/redirects to correct pages
  test 'should render new on invalid create' do
    get :create, product: { status: 'Planned' }
    assert !response.error?, 'Should handle errors instead of passing them'
    assert_template :new
  end

  test 'should generate index' do
    assert_generates '/products', controller: 'products', action: 'index'
  end

  test 'should generate show' do
    assert_generates '/products/4', controller: 'products', action: 'show',
                                    id: 4
  end

  test 'should generate new' do
    assert_generates '/products/new', controller: 'products', action: 'new'
  end
end
