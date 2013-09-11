class ReviewsController < ApplicationController
	before_filter :ensure_logged_in, :only => [:edit, :create, :show, :update, :destroy]
	before_filter :load_product

  def show
  	@review = Review.find(params[:id])
  end

  def create
  	@review = @product.reviews.build params.require(:review).permit(:comment, :product_id, :user_id)
  	@review.user_id = current_user.id

  	if @review.save
  		redirect_to products_path, notice: 'Review created successfully!'
  	else
  		render :action => :show
  	end
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  end

  private

  def load_product
  	@product = Product.find(params[:product_id])
  end
end
