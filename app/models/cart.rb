# frozen_string_literal: true

class Cart < ApplicationRecord

  include DiscountPriceModule

  has_many :orderables
  has_many :products, through: :orderables
  has_one :bills
  def total
    sum=orderables.to_a.sum(&:total)
  end
  
end
