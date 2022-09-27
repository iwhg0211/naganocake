class AddTelephoneToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :telephone, :string
  end
end
