class ProductsController < ApplicationController
  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end
end
