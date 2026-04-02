require 'active_record'
require_relative 'order_record'

# order repository
class OrderRepository
  def all
    # order... orderby, to_a... 配列化
    OrderRecord.order(:id).to_a # :id シンボル記法, stringと違って軽量であり識別子はこの記法を用いることが多い
  end

  def add(customer:, amount:)
    # create validate error時は例外を投げる
    OrderRecord.create!(customer: customer, amount: amount)
  end

  def total_amount
    # sum
    OrderRecord.sum(:amount)
  end
end

# ActiveRecord

# === create ===
puts "\n--- create ---"
OrderRecord.create!(customer: "Taro", amount: 10000)

# === select ===
puts "\n--- select ---"
OrderRecord.select(:id, :customer, :amount).each do |o|
  puts "id=#{o.id} customer=#{o.customer} amount=#{o.amount}"
end

# === where ===
puts "\n--- where ---"
puts OrderRecord.where(customer: 'Taro').count

# === group by ===
puts "\n--- group by ---"
grouped = OrderRecord.group(:customer).sum(:amount)
grouped.each do |k, total|
  puts "customer=#{k} total=#{total}"
end

# === 1件取得 ===
puts "\n--- 1件取得(find_by) ---"
one = OrderRecord.find_by(customer: 'Hanako')
puts one ? "found id=#{one.id} amount=#{one.amount}" : 'not found'

# === update ===
puts "\n--- update ---"
target = OrderRecord.find_by(customer: 'Taro')
if target
  target.update!(amount: target.amount + 1000)
  puts "updated id=#{target.id} new_amount=#{target.amount}"
end

# === delete(物理削除) ===
puts "\n--- delete ---"
delete_target = OrderRecord.find_by(customer: 'Taro')
if delete_target
  deleted_id = delete_target.id
  delete_target.destroy
  puts "deleted id=#{deleted_id}"
end
