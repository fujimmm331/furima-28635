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
      pay_item
      @purchase_delivery_information.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_delivery_information).permit(:postal_code, :delivery_source_id, :municipality, :address, :building, :telephone_number, :purchase).merge(user: current_user.id, product: @product.id, token: params[:token])
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def redirect_to_root
    # 出品者が現在のユーザーと同じ、もしくは既に購入された商品の場合、ルートパスへ遷移する処理
    product_ids = Purchase.pluck(:product_id) # Purchaseモデルからproduct_idだけを取得
    redirect_to root_path if current_user.id == @product.user_id || product_ids.include?(@product.id)
    # //出品者が現在のユーザーと同じ、もしくは既に購入された商品の場合、ルートパスへ遷移する処理
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
