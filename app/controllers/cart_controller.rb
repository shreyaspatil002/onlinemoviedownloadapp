# frozen_string_literal: true

class CartController < ApplicationController
  def index
    Cart.all
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
      @cart.orderables.create(product: @product, quantity: quantity, customer_name: current_user.profile&.first_name && current_user.profile&.last_name, address:current_user.profile&.address , price:Product.pluck(:price) ,final_price: @cart.discount_price)
    end
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
  end
end
