# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :orderables
  has_many :products, through: :orderables
  def total
    orderables.to_a.sum(&:total)
  end

  def discount_price
    discount = 0.1
    if orderables.to_a.sum(&:total) > 2000
      sum=orderables.to_a.sum(&:total) - (orderables.to_a.sum(&:total) * discount)
    else
      sum=orderables.to_a.sum(&:total)
    end
  end
end
