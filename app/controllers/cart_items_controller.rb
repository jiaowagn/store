class CartItemsController < ApplicationController
  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @cart_item.update(cart_item_params)
    redirect_to carts_path
  end

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy
    flash[:warning] = "成功将 #{@product.title} 从购物车删除！"
    redirect_back(fallback_location: carts_path)
  end

  protected
  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
