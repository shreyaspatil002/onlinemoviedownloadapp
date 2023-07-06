class ReviewsController < ApplicationController
  
   before_action :set_product, only: [:new, :create]
     
        def create
            @product = Product.find(params[:product_id])
            @review = @product.reviews.create(review_params)
            authorize @review
            #p review.errors.full_messages.inspect
            redirect_to  product_path(@product), notice: 'review created !!!'
          
        end
        
        def show
        end
      
        def destroy
          @product = Product.find(params[:product_id])
          
          @review = @product.reviews.find(params[:id])
          authorize @review
          @review.destroy
          redirect_to product_path(@product), notice: 'review deleted !!!'
         
        end 
        private
      
        def set_product
          @product = Product.find(params[:product_id])
        end
       
        def review_params
          params.require(:review).permit(:user_name, :rating, :comments)
        end
    
    
    
end
