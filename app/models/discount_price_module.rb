# app/models/discount_module.rb
module DiscountPriceModule
  
    def apply_discount
      
      discount_threshold = 2000
      discount_percentage = 0.10
      total_price=orderables.to_a.sum(&:total)
      if total_price > discount_threshold
        discount_amount = total_price* discount_percentage
         discounted_price =total_price - discount_amount
        return discounted_price
      else
        return total_price
      end
    end

    # def apply_discount
    #   discount_threshold = 2000
    #   discount_percentage = 0.10
  
    #   total_price = Orderable.where('discount > ?', discount_threshold).sum(:final_price)
    #   discounted_price = total_price - (total_price * discount_percentage)
  
    #   return discounted_price > 0 ? discounted_price : total_price
    # end   
end
  
 