require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'should not save without name' do
    product = Category.new(description: 'Paperback and electronic books')
    assert_not product.save
  end

  test 'can save when name is present' do
    product = Category.new(
      name: 'Books',
      description: 'Paperback and electronic books'
    )
    assert product.save
  end
end
