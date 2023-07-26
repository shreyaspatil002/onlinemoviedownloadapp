# frozen_string_literal: true

class CartController < ApplicationController
  before_action :set_cart
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
      @cart.orderables.create(product: @product, quantity: quantity, customer_name: current_user.profile&.first_name,
                              address: current_user.profile&.address, price: @product.price, final_price: quantity * @product.price, discount: @cart.apply_discount)
    end
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
  end
  def pay
    # @product = Product.find(params[:product_id])
    # quantity = params[:quantity].to_i
    # current_cart_item = @cart.orderables.find_by(product_id: @product.id)
    # if current_cart_item && quantity.positive?
    #   current_cart_item.update(quantity: quantity)

    # elsif quantity <= 0
    #   current_cart_item.destroy

    # else
      @cart.cart_items.create(product: @product, quantity: 2, customer_name: current_user.profile&.first_name,
                              address: current_user.profile&.address, price: 100, final_price: 2 * 100, discount: @cart.apply_discount)
    # end
  end

  def set_cart
    @cart = current_user.cart || current_user.create
  end
end
