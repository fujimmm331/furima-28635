class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :create, :destroy]
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :protect_user, only: [:edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :explanation, :category_id, :condition_id, :delivery_charge_id, :delivery_source_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def protect_user
    redirect_to root_path if @product.user.id != current_user.id
  end
end
