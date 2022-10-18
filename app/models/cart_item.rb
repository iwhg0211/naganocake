class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def cart_item_subtotal
    cart_item.item.price * cart_item.amount * 1.1
  end

end
