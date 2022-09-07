class CartItem < ApplicationRecord
  belongs_to :item, :customer
end
