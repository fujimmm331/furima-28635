class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
    @product = Product.find(params[:product_id])
  end
end
