class ProductsController < ApplicationController
  before_filter :ensure_logged_in, :only => [:show]

  def index
  	@products = Product.all

    respond_to do |format|
      format.html
      format.json { render json: @products }
    end
  end

  def show
  	@product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end

    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  def new
  	@product = Product.new

    respond_to do |format|
      format.html
      format.json { render json: @products }
    end
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def create
  	@product = Product.new product_parameters
    respond_to do |format|
    	if @product.save
    		format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
    	else
    		format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
    	end
    end
  end

  def update
  	@product = Product.find(params[:id])

    respond_to do |format|
    	if @product.update_attributes product_parameters
    		format.html { redirect_to @product, notice: 'Product was successfully updated.'}
        format.json { head :no_content }
    	else
    		format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
    	end
    end
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
    
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
  def product_parameters
    params.require(:product).permit(:name, :description, :price_in_cents, :url)
  end
end
