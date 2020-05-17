class AddOrderItemToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_items, :order, null: false, foreign_key: true,null:false
  end
end
