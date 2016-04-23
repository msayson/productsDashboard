class Product < ActiveRecord::Base
   validates :title, presence: true
   validates :status, presence: true

   def self.status_counts
      Product.group(:status).count
   end
end
