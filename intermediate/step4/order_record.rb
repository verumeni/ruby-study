require 'active_record'

# Order Record
class OrderRecord < ActiveRecord::Base
  # 下記はモデルを定義するためのコード
  # class定義時に実行
  self.table_name = 'orders'

  # validate
  validates :customer, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0 }
end
