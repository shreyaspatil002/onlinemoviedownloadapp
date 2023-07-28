# frozen_string_literal: true

class Orderable < ApplicationRecord
  include DiscountQtyModule
  include DiscountPriceModule

  belongs_to :product
  belongs_to :cart
  # has_one :orderables

  def total
    product.price * quantity
  end
 
end
