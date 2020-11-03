class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product
  before_action :redirect_to_root

  def new
    @purchase_delivery_information = PurchaseDeliveryInformation.new
  end

  def create
    @purchase_delivery_information = PurchaseDeliveryInformation.new(purchase_params)
    if @purchase_delivery_information.valid?
      @purchase_delivery_information.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def purchase_params
    params.require(:purchase_delivery_information).permit(:postal_code, :delivery_source_id, :municipality, :address, :building, :telephone_number, :purchase).merge(user: current_user.id, product: @product.id)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def redirect_to_root
    if current_user.id == @product.user_id
      redirect_to root_path
    end
  end
end
