class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  enum status: { waiting_for_pay_ment: 0, pay_confirmation: 1, production: 2, preparing_to_ship: 3, sent: 4 }
  #waiting_for_payment=>入金待ち payment_configmation=>入金確認 production=>製作中 preparing_to_ship=>発送準備中 sent=>発送済

  enum pay_method: { credit_card: 0, transfer: 1 }
  #credit_card=>クレジットカード transfer=>銀行振込

  def address_display
    '〒' + postal_code + '' + address + '' + name
  end

end