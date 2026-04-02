require 'active_record'
require 'logger'
require_relative 'db_setup'
require_relative 'order_repository'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: DB_PATH
)

# 実行SQLを出力
# ActiveRecord::Base.logger = Logger.new($stdout)

repo = OrderRepository.new

# repo.add(customer: 'Taro', amount: 3000)
# repo.add(customer: 'Hanako', amount: 8000)

puts '--- orders ---'
repo.all.each do |o|
  puts "[#{o.id}] customer=#{o.customer} amount=#{o.amount}"
end

puts "total_amount=#{repo.total_amount}"
