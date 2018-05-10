class CreateProductLists < ActiveRecord::Migration[5.2]
  def change
    create_table :product_lists do |t|
      t.integer :order_id
      t.integer :product_price
      t.string :product_name
      t.integer :quantity

      t.timestamps
    end
  end
end
