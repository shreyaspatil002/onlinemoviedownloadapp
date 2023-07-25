module DiscountQtyModule
   
    def qty_discount
        discount = 0.05
        if quantity > 2
            product.price * quantity - ((product.price*quantity) * discount)
        else
            product.price * quantity
        end
    end
end