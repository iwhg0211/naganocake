class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum created_status: { 'cannot_make': 0, 'stay_making': 1, 'making': 2, 'have_made': 3 }
end