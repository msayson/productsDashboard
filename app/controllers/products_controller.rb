class ProductsController < ApplicationController
   #Expose sort_column and sort_direction methods to helper functions
   helper_method :sort_column, :sort_direction

   def index
      @productsbytitle = Product.order(product_order_params)
      @statuscounts = Product.group(:status).count
   end

   def show
      @product = Product.find(params[:id])
   end

   def new
      @product = Product.new
   end

   def create
      @product = Product.new(product_params)

      if @product.save
         redirect_to @product
      else
         render 'new'
      end
   end

   private
      def product_params
         params.require(:product).permit(:title, :status, :supportedFeatures)
      end

      def product_order_params
         sort_column + " " + sort_direction
      end

      def sort_column
         #Default to sorting by title
         Product.column_names.include?(params[:sort]) ? params[:sort] : "title"
      end

      def sort_direction
         #Default to ascending order
         %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
end
