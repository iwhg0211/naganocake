class Customer < ApplicationRecord
  has_many :cart_items
  has_many :addresses
  has_many :orders
end
