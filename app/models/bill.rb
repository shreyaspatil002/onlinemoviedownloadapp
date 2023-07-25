class Bill < ApplicationRecord
  belongs_to :Orderable
  belongs_to :product
  belongs_to :cart
end
