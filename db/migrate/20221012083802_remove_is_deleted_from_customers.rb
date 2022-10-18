class RemoveIsDeletedFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :is_deleted, :boolean
    add_column :customers, :is_deleted, :boolean, default: false
  end
end
