class CartItemsController < ApplicationController
  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy
    flash[:warning] = "成功将 #{@product.title} 从购物车删除！"
    redirect_back(fallback_location: carts_path)
  end
end
