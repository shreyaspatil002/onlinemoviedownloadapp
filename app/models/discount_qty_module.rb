# frozen_string_literal: true

module DiscountQtyModule
  def qty_discount
    @discount_percentage=Discount.find_by(code: 'qtyp2')
    discount_percentage=@discount_percentage.discount_percentage
    if quantity > 2
      product.price * quantity - ((product.price * quantity) * discount)
    else
      product.price * quantity
    end
  end
end
