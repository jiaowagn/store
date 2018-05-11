class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :pay_with_alipay, :pay_with_wechat]
  before_action :find_order, execpt: [:create]
  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price
    if @order.save
      current_cart.cart_items.each do |cart_item|
        product_list = ProductList.new
        product_list.order = @order
        product_list.product_name = cart_item.product.title
        product_list.product_price = cart_item.product.price
        product_list.quantity = cart_item.quantity
        product_list.save
      end
      redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

  def show
    @product_lists = @order.product_lists
  end

  def pay_with_alipay
    @order.set_payment_with!('alipay')
    @order.pay!
    flash[:notice] = "使用支付宝成功完成付款"
    redirect_to order_path(@order.token)
  end

  def pay_with_wechat
    @order.set_payment_with!('wechat')
    @order.pay!
    flash[:notice] = "使用微信成功完成付款"
    redirect_to order_path(@order.token)
  end

  private
  def find_order
    @order = Order.find_by_token(params[:id])
  end

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
