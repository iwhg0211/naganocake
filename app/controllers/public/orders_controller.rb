class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @total_price = 0
    @cart_items.each do |cart_item|
      #@total_price += cart_item.subtotal
      @total_price = cart_item.subtotal + @total_price
    end
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order = @address.name
    debugger
    #@cart_items.destroy_all
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to order_complete_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = current_customer.created_at
    @cart_items = current_customer.cart_items
    @total_price = 0
    @cart_items.each do |cart_item|
      #@total_price += cart_item.subtotal
      @total_price = cart_item.subtotal + @total_price
    end


  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :status, :pay_method, :postal_code, :address, :billing_amount, :postage)
  end

end