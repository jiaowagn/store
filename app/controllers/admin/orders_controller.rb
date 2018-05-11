class Admin::OrdersController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required
  before_action :find_order, except: [:index]

  def index
    @orders = Order.order("id DESC")
  end

  def show
    @product_lists = @order.product_lists
  end

  def cancel
    @order.cancel_order!
    redirect_back(fallback_location: admin_orders_path)
  end

  def ship
    @order.ship!
    redirect_back(fallback_location: admin_orders_path)
  end

  def shipped
    @order.deliver!
    redirect_back(fallback_location: admin_orders_path)
  end

  def return
    @order.return_good!
    redirect_back(fallback_location: admin_orders_path)
  end

  protected
  def find_order
    @order = Order.find(params[:id])
  end
end
