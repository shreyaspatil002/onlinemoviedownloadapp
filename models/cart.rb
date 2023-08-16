# frozen_string_literal: true

class Cart < ApplicationRecord
  include DiscountPriceModule

  has_many :orderables
  has_many :products, through: :orderables
  # validate :validate_age_restriction_for_product

  def total
    orderables.to_a.sum(&:total)
  end
  # private
  # def age_restricted?(product)
  #   product.age_restricted?
  # end

  # def allowed_to_purchase?(product, user)
  #   # to check if the user is allowed to purchase the product
  #   user_age = calculate_user_age(user)
  #   min_age_required = min_age_required(product)
  #   user_age >= min_age_required
  # end

  # def min_age_required(product)
  #   # to retrieve the minimum age required for the product
  #   product.min_age_required
  # end

  # def calculate_user_age(user)
  #   # to calculate age of the user
  #   current_year = Date.current.year # year will take only year from that date
  #   user_birth_year = user.profile&.date_of_birth&.year
  #   current_year - user_birth_year
  # end
end

# ADD CONTROLLERMETHOD

# def add
#   @product = Product.find_by(id: params[:id])
#   quantity = params[:quantity].to_i
#   current_orderable = @cart.orderables.find_by(product_id: @product.id)

#   if current_orderable && quantity.positive?
#     current_orderable.update(quantity: quantity)
#   elsif quantity <= 0
#     current_orderable.destroy
#   else
#     if age_restricted?(@product)
#       user = current_user
#       if allowed_to_purchase?(@product, user)
#         # Add the orderable to the cart
#         @cart.orderables.create(
#           product: @product,cart_id: @cart.id,quantity: quantity,customer_name: user.profile&.first_name,status: 'unpaid',address: user.profile&.address,price: @product.price,final_price: quantity * @product.price,discount: 0.0,customer_id: user.profile&.user_id
#         )
#       else
#         flash[:error] = "You must be at least #{min_age_required(@product)} years old to purchase this product."
#       end
#     else
#       # Add the orderable to the cart
#       @cart.orderables.create(
#         product: @product,cart_id: @cart.id,quantity: quantity,customer_name: current_user.profile&.first_name,status: 'unpaid',address: current_user.profile&.address,price: @product.price,final_price: quantity * @product.price,discount: 0.0,customer_id: current_user.profile&.user_id
#       )
#     end
#   end
# end
