# frozen_string_literal: true

class Cart < ApplicationRecord
  include DiscountPriceModule
  belongs_to :user
  has_many :orderables
  has_many :products, through: :orderables
  has_one :bills
  has_many :cart_items 
  has_many :products, through: :cart_items
  def total
    orderables.to_a.sum(&:total)
  end
end
