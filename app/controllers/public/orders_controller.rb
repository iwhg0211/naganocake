class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
  end

  def complete
  end

  def create
  end

  def index
    @orders = current_customer.orders.address
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :status, :pay_method, :postal_code, :address, :billing_amount, :postage)
  end
  
end
