class PurchasesController < ApplicationController
  def new
    @purchase_delivery_information = PurchaseDeliveryInformation.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
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
end
