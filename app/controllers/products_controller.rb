class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :create]
  before_action :protect_user, only: [:edit, :update,]

  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :explanation, :category_id, :condition_id, :delivery_charge_id, :delivery_source_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def protect_user
    if Product.find(params[:id]).user.id != current_user.id
      redirect_to root_path
    end
  end
end
