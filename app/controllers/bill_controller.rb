class BillController < ApplicationController

    def add
        @product = Product.find_by(id: params[:id])
        @cart = Cart.find_by(id: params[:id])
        quantity = params[:quantity].to_i
        current_cart = @bill.carts.find_by(product_id: @cart.id)
        if current_orderable && quantity.positive?
          current_orderable.update(quantity: quantity)
    
        else
          @bill.orderables.create(product: @product, cart: @cart, quantity: @orderable.quantity, product_name: @product.name ,customer_name: current_user.profile&.first_name,
                                  address: @orderable.address, product_price: @product.price, total_product_price: @orderable.final_price, cart: @cart.apply_discount)
        end
      end
end
