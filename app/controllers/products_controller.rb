# Controller for Product dashboard
class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @filterrific = init_filterrific || return # Redirect to reset filterrific
    @products = @filterrific.find.page(params[:page])
    @statuscounts = Product.status_counts

    # Respond to html for initial page load and to js for AJAX filter updates.
    respond_to do |format|
      format.html
      format.js
    end
  rescue ActiveRecord::RecordNotFound => err
    puts "Resetting filterrific params: #{err.message}"
    redirect_to(reset_filterrific_url(format: :html)) && return
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

  def init_filterrific
    initialize_filterrific(
      Product,
      params[:filterrific],
      select_options: {
        sorted_by: Product.options_for_sorted_by,
        with_category: Product.options_for_with_category
      }
    )
  end
end
