class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  validates :name, presence: { message: "商品名を入力してください" }
  validates :price, presence: { message: "価格を入力してください" },
                    numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "価格は0以上の整数で入力してください" }
end
