# frozen_string_literal: true

class Orderable < ApplicationRecord
  include DiscountPriceModule

  belongs_to :product
  belongs_to :cart

  def total
    product.price * quantity
  end
end
