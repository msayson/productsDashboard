# Helper for ProductsController
module ProductsHelper
  def sortable_column(column, title = nil)
    title ||= column.titleize # Titlecase name if exists
    sort_dir = ProductsHelper.next_sort_dir(column, sort_column, sort_direction)
    link_to title, {
      sort: column, # Query parameters
      direction: sort_dir
    }, class: 'sortable_column'
  end

  def self.next_sort_dir(column, sort_col, curr_sort_dir)
    if column == sort_col && curr_sort_dir == 'asc'
      'desc'
    else
      'asc'
    end
  end
end
