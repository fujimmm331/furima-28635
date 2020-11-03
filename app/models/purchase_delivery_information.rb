class PurchaseDeliveryInformation
  include ActiveModel::Model
  attr_accessor :user, :product, :postal_code, :delivery_source_id, :municipality, :address, :building, :telephone_number, :purchase
  
  validates :user, :product, :postal_code, :delivery_source_id, :municipality, :address, :building, 
            :telephone_number, presence: true
  
  validates_format_of :postal_code, {with: /\A\d{3}[-]\d{4}\z/, message: "must be 7digits and include 「-」" }
  validates_format_of :telephone_number, {with: /\A\d{11}\z/, message: "within 11 digits"}

  validates :delivery_source_id, numericality: { other_than: 1, message: "-- is can't choose" }

  def save
    purchase = Purchase.create(user_id: user, product_id: product)
    DeliveryInformation.create(postal_code: postal_code, delivery_source_id: delivery_source_id, municipality: municipality, address: address, building: building, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end