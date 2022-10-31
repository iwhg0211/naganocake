class Admin::OrdersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    @items = Item.all
  end

  def update
  end
    
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :status, :pay_method, :postal_code, :address, :billing_amount, :postage, :name)
  end

  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end
  
  
end
