# ActiveRecord Model for Products
class Product < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :title, presence: true
  validates :status, presence: true

  def self.status_counts
    Product.group(:status).count
  end
end
