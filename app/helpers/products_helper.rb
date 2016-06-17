module ProductsHelper
  def list_categories_by_name(product)
    product.categories.map(&:name).join(', ')
  end
end
