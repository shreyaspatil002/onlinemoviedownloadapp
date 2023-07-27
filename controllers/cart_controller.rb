# frozen_string_literal: true

class CartController < ApplicationController
  
  def index
    @orderables = Orderable.all
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
      @cart.orderables.create(product: @product, quantity: quantity, customer_name: current_user.profile&.first_name,status: 'unpaid',
                              address: current_user.profile&.address, price: @product.price, final_price: quantity * @product.price, discount: @cart.apply_discount)
    end
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
  end
 
  def pay
  
    @cart.orderables.update(status: 'paid')
  end

 
end
