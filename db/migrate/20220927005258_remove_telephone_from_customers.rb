class RemoveTelephoneFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :telephone, :string
  end
end
