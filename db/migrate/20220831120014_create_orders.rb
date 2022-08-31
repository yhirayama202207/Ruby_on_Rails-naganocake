class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :shipping_cost, null: false
      t.integer :total_payment, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :status, null: false, default: 0
      
      enum payment_method: { credit_card: 0, transfer: 1 }
      enum status: { not_yet_paid: 0, paid: 1, in_production: 2, shipping_preparation: 3, sent: 4 }

      t.timestamps
    end
  end
end
