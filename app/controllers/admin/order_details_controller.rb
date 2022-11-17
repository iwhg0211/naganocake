class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order_detail.order.id)
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :status, :pay_method, :postal_code, :address, :billing_amount, :postage, :name)
  end

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :amount, :created_status, :purchase_price)
  end

end