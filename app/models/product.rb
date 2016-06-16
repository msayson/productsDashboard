# ActiveRecord Model for Products
class Product < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :title, presence: true
  validates :status, presence: true

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^title_/
      order("LOWER(products.title) #{direction}")
    when /^status_/
      order("LOWER(products.status) #{direction}")
    else
      raise(ArgumentError, 'Invalid sort option')
    end
  }

  # Searches products on title, matches using LIKE
  scope :search_by_title, lambda { |query|
    return nil if query.blank?

    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)

    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map do |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    end
    where(
      terms.map { '(LOWER(products.title) LIKE ?)' }.join(' AND '),
      *terms.flatten
    )
  }

  # Sort and filter queries to provide to filterrific
  filterrific(
    default_filter_params: { sorted_by: 'title_asc' },
    available_filters: [
      :sorted_by,
      :search_by_title
    ]
  )

  # Provide select options for filterrific sorted_by query
  def self.options_for_sorted_by
    [
      ['Title (a-z)', 'title_asc'],
      ['Status (a-z)', 'status_asc']
    ]
  end

  def self.status_counts
    Product.group(:status).count
  end
end
