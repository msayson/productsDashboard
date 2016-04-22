module ProductsHelper
   def sortableColumn(column, title = nil)
      title ||= column.titleize #Titlecase name if exists
      direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
      link_to title, {:sort => column, :direction => direction}
   end
end
