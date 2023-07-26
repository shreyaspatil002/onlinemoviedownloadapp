# class CartItemsController < ApplicationController
#   before_action :set_cart

#   before_action :set_product, only: [:create]

#   before_action :set_cart_item, only: %i[update destroy]

#   def create  
#     if @orderable.save
#       @cart_item = @cart.cart_items.find_or_initialize_by(product_id: @product.id)
#       @cart_item.quantity = params[:quantity].to_i
#       @cart_item.price = @product.price
#       if @cart_item.save
#         redirect_to cart_path, notice: 'Product added to cart.'
#       else
#         redirect_to product_path(@product), alert: 'Failed to add product to cart.'
#       end
#     else
#       redirect_to product_path(@product), alert: 'Failed to create cart.'
#     end
#   end

#   private
#   def set_cart
#     @cart = current_user.cart || current_user.create_cart
#   end
#   def set_product
#     @product = Product.find(params[:product_id])
#   end
#   def set_cart_item
#     @cart_item = CartItem.find(params[:id])
#   end
#   def cart_item_params
#     params.require(:cart_item).permit(:quantity)
#   end
# end

