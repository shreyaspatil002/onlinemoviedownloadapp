class Orderable < ApplicationRecord
  belongs_to :product
  belongs_to :cart
 

  
  def total
    if quantity > 2
      product.price * quantity - ((product.price * quantity) /20) 
    else
      product.price * quantity
    end 
    
  end
     
end
