class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)
    redirect_back(fallback_location: products_path)
    flash[:notice] = "加入购物车成功"
  end
end
