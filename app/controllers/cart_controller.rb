# frozen_string_literal: true

class CartController < ApplicationController
  def index
    @orderables = Orderable.order(created_at: :desc)
    return unless [current_user.profile&.user_id].present?

    @order_histories = Orderable.where('customer_id LIKE ?',
                                       "%#{current_user.profile&.user_id}%").order(created_at: :desc)
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
      @cart.orderables.create(product: @product, cart_id: @cart.id, quantity: quantity, customer_name: current_user.profile&.first_name, status: 'unpaid',
                              address: current_user.profile&.address, price: @product.price, final_price: quantity * @product.price, discount: 0.0, customer_id: current_user.profile&.user_id)
    end
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
  end

  def pay
    @cart.orderables.update(discount: @cart.apply_discount, status: 'paid', updated_at: @cart.updated_at + 5.days)
    @cart.update(status: true)
   
  end
end
