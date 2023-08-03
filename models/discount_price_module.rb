# app/models/discount_module.rb
module DiscountPriceModule
  def apply_discount
    discount_threshold = 2000
    discount_by_qty= 2
    total_price = orderables.to_a.sum(&:total)

    @discount_percentage_of_price=Discount.find_by(code: 'p10')
    discount_percentage_of_price=@discount_percentage_of_price.discount_percentage
    discount_limit_for_price=@discount_percentage_of_price.limit

    @discount_percentage_of_qty=Discount.find_by(code: 'qtyp2')
    discount_percentage_of_qty=@discount_percentage_of_qty.discount_percentage
    discount_limit_for_qty=@discount_percentage_of_qty.limit

    if total_price > discount_threshold && @discount_percentage_of_qty.discount_percentage < @discount_percentage_of_price.discount_percentage 

      discount_amount = total_price * discount_percentage_of_price/100
      if discount_amount < discount_limit_for_price
        total_price - discount_amount 
      else 
        total_price - discount_limit_for_price
      end
      
    elsif orderables.where("quantity > #{discount_by_qty}").any?
      # @discount_percentage=Discount.find_by(code: 'qtyp2')
      # discount_percentage=@discount_percentage.discount_percentage
      discount_amount = total_price * discount_percentage_of_qty/100
      if discount_amount < discount_limit_for_qty
        total_price - discount_amount 
      else 
        total_price - discount_limit_for_qty
      end

    else
      return total_price 
    end 

  end
end
