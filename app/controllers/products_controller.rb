# Controller for Product dashboard
class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # Expose sort_column and sort_direction methods to helper functions
  helper_method :sort_column, :sort_direction

  def index
    @productsbytitle = Product.order(product_order_params)
    @statuscounts = Product.status_counts
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    logger.error "Attempt to access invalid product #{params[:id]}"
    redirect_to '/products', notice: 'Invalid product'
  end

  def product_params
    params.require(:product)
          .permit(:title, :status, category_ids: [])
  end

  def product_order_params
    sort_column + ' ' + sort_direction
  end

  def sort_column
    # Default to sorting by title
    Product.column_names.include?(params[:sort]) ? params[:sort] : 'title'
  end

  def sort_direction
    # Default to ascending order
    %w(asc desc).include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
