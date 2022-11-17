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
      @cart_item.customer_id=current_customer.id
      @cart_items=current_customer.cart_items.all
            if @cart_items.find_by(item_id: params[:cart_item][:item_id].to_i).present?
              cart_item = @cart_items.find_by(item_id: params[:cart_item][:item_id].to_i)
              new_amount = cart_item.amount + params[:cart_item][:amount].to_i
              cart_item.update_attribute(:amount, new_amount)
            else
              @cart_item.save
            end
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
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end