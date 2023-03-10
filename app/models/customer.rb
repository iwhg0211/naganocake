class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :orders
  has_many :addresses

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/}
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :address, presence: true
  

  def active_for_authentication?
    super && (is_deleted != true)
  end
end
