class Purchase < ApplicationRecord
  has_one :delivery_information
  belongs_to :user
  belongs_to :product
end
