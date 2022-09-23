class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.integer :status
      t.integer :pay_method
      t.string :postal_code
      t.string :address
      t.integer :billing_amount
      t.integer :postage
      t.timestamps
    end
  end
end
