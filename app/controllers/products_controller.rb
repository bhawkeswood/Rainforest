class ProductsController < ApplicationController
  def index
  	@products = Product.all

    respond_to do |format|
      format.html
      format.json { render json: @products }
    end
  end

  def show
  	@product = Product.find(params[:id])

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

  	if @product.save
  		redirect_to products_url
  	else
  		render :new
  	end
  end

  def update
  	@product = Product.find(params[:id])

  	if @product.update_attributes product_parameters
  		redirect_to @product
  	else
  		render :edit
  	end
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
    redirect_to products_url
  end

  private
  def product_parameters
    params.require(:product).permit(:name, :description, :price_in_cents, :url)
  end
end
