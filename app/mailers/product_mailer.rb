# frozen_string_literal: true

class ProductMailer < ApplicationMailer
  def notify_product_creation(product_id)
    @product = Product.find(product_id)
    mail(to: 'test@gmail.com', subject: "Product #{@product.name} has been created")
  end
end
