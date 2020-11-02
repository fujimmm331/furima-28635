class DeliveryInformation < ApplicationRecord
  belongs_to :purchase
  belongs_to_active_hash :delivery_source
end
