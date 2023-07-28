# frozen_string_literal: true

class Cart < ApplicationRecord
  include DiscountPriceModule
  include DiscountQtyModule
  
  has_many :orderables
  has_many :products, through: :orderables
  def total
    orderables.to_a.sum(&:total)
  end
  
end
