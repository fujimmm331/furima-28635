class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_source
  belongs_to_active_hash :days_to_ship

  validates :image, :name, :explanation, :category_id, :condition_id,
            :delivery_charge_id, :delivery_source_id, :days_to_ship_id,
            :price, :user, presence: true

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is from 300 yen to 9999999 yen, half-width only' }

  validates :category_id, :condition_id, :delivery_charge_id, :delivery_source_id, :days_to_ship_id, numericality: { other_than: 1, message: "-- is can't choose" }
end
