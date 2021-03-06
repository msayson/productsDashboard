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

  scope :with_category, lambda { |category_id|
    joins(:categories).where(id: category_id).uniq unless category_id.nil?
  }

  # Searches products on title, matches using LIKE
  scope :search_by_title, lambda { |query|
    return nil if query.blank?

    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    search_term =
      (query.downcase.tr('*', '%') + '%')
      .gsub(/%+/, '%')

    where(
      [search_term].map { '(LOWER(products.title) LIKE ?)' }.join(' AND '),
      search_term
    )
  }

  # Sort and filter queries to provide to filterrific
  filterrific(
    default_filter_params: { sorted_by: 'title_asc' },
    available_filters: [
      :sorted_by,
      :search_by_title,
      :with_category
    ]
  )

  # Provide select options for filterrific sorted_by query
  def self.options_for_sorted_by
    [
      ['Title (a-z)', 'title_asc'],
      ['Status (a-z)', 'status_asc']
    ]
  end

  # Provide select options for filterrific with_category query
  def self.options_for_with_category
    Category.all.map { |c| [c.name, c.id] }
            .sort! { |left, right| left[0].downcase <=> right[0].downcase }
            .unshift(['', nil])
  end

  def self.status_counts
    Product.group(:status).count
  end
end