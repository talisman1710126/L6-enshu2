class CartitemsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @cart_item = CartItem.new
  end

  def create
    product = Product.find(params[:cart_item][:product_id])
    qty = params[:cart_item][:qty].to_i
    item = current_cart.cart_items.find_by(product_id: product.id)
    if item
      item.update(qty: item.qty + qty)
    else
      current_cart.cart_items.create(product: product, qty: qty)
    end
    redirect_to cart_path(current_cart)
  end

  def destroy
    current_cart.cart_items.find(params[:id]).destroy
    redirect_to cart_path(current_cart)
  end
end
