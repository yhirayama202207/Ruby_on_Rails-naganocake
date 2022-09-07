class OrderDetail < ApplicationRecord
  enum making_status: { can_not_product: 0, not_yet_started: 1, in_progress: 2, done: 3 }
  belongs_to :item, :order
end
