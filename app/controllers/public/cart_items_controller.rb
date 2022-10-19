class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @total_price = 0
    @cart_items.each do |cart_item|
      #@total_price += cart_item.subtotal
      @total_price = cart_item.subtotal + @total_price
    end
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_items = current_customer.cart_items.find(params[:id])
    @cart_items.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount, :customer_id)
  end

end