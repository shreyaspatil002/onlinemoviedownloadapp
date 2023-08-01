# frozen_string_literal: true

class Cart < ApplicationRecord
  include DiscountPriceModule
  include DiscountQtyModule
  
  has_many :orderables
  has_many :products, through: :orderables
  def total
    orderables.to_a.sum(&:total)
  end
  # def qty
  #   orderables.to_i.(&:quantity)
  # end 
  # def applied_discount
  #   if @cart.apply_discount < @cart.qty_discount
  #     return @cart.qty_discount
  #   else 
  #     return @cart.apply_discount
  #   end
  # end 
end
