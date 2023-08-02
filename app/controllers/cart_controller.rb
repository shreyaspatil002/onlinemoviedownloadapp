# frozen_string_literal: true

class CartController < ApplicationController

  def index
    @orderables = Orderable.order(created_at: :desc)
    if [current_user.profile&.first_name].present?
      @order_histories = Orderable.where("customer_name LIKE ?", "%#{current_user.profile&.first_name}%").order(created_at: :desc)
    end
  end

  def show
    @render_cart = false
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity.positive?
      current_orderable.update(quantity: quantity)

    elsif quantity <= 0
      current_orderable.destroy

    else
      @cart.orderables.create(product: @product,cart_id: @cart.id, quantity: quantity, customer_name: current_user.profile&.first_name,status: 'unpaid',
                              address: current_user.profile&.address, price: @product.price, final_price: quantity * @product.price, discount: 0.0)
    end
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
  end
 
  def pay
    
    @cart.orderables.update(discount: @cart.apply_discount)
    @cart.orderables.update(status: 'paid')
    @cart.orderables.update(updated_at: @cart.updated_at + 5.days)
    
  end

end


  
 
    
  
    
  
    
  
  #   def invoice()
  
  #     @cart = current_user.cart
  
  #     @cart.status = "Paid"
  
  #     @order = Order.find(params[:order_id])
  
  #     @order_items = @order.order_items
  
  #     @user = @order.user
  
  #     @status = @cart
  
  #     @cart_items = current_user.cart.cart_items.includes(:product)
  
  #     @total_amount = @cart_items.sum { |cart_item| cart_item.price.to_i * cart_item.quantity }
  
  #     # @total_amount = @order.total_amount # Use the total_amount from the order, which already considers the discount
  
  #   end