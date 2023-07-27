# frozen_string_literal: true

# app/models/discount_module.rb
module DiscountPriceModule
  def apply_discount
    discount_threshold = 2000
    discount_percentage = 0.10
    total_price = orderables.to_a.sum(&:total)
    return total_price unless total_price > discount_threshold

    discount_amount = total_price * discount_percentage
    total_price - discount_amount
  end
end
