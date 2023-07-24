# frozen_string_literal: true

class Orderable < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total
    @discount = 0.05
    if quantity > 2
      product.price * quantity - (product.price * @discount)
    else
      product.price * quantity
    end
  end
  
  
end
