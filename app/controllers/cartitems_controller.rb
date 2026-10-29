class CartitemsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @cart_item = CartItem.new
  end

  def create
    product = Product.find(params[:cart_item][:product_id])
    qty = params[:cart_item][:qty].to_i
    if qty < 1
      redirect_to new_cartitem_path(product_id: product.id), alert: "数量は1以上で入力してください"
      return
    end
    item = current_cart.cart_items.find_by(product_id: product.id)
    if item
      item.update(qty: item.qty + qty)
    else
      current_cart.cart_items.create(product: product, qty: qty)
    end
    redirect_to cart_path(current_cart), notice: "#{product.name}を#{qty}個カートに追加しました"
  end

  def destroy
    item = current_cart.cart_items.find(params[:id])
    item.destroy
    redirect_to cart_path(current_cart), notice: "#{item.product.name}をカートから削除しました"
  end
end
