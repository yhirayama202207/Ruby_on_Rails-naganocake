class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :price, null: false
      t.integer :amount, null: false
      t.integer :making_status, null: false, default: 0
      
      enum making_status: { can_not_product: 0, not_yet_started: 1, in_progress: 2, done: 3 }

      t.timestamps
    end
  end
end
