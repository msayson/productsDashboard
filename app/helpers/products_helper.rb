# Helper for ProductsController
module ProductsHelper
  def sortable_column(column, title = nil)
    title ||= column.titleize # Titlecase name if exists
    direction = getdirection(column)
    link_to title, {
      sort: column,
      direction: direction
    }, class: 'sortable_column'
  end

  private

  def getdirection(column)
    if column == sort_column && sort_direction == 'asc'
      'desc'
    else
      'asc'
    end
  end
end
