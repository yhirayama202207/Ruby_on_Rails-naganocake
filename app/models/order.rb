class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { not_yet_paid: 0, paid: 1, in_production: 2, shipping_preparation: 3, sent: 4 }
end
