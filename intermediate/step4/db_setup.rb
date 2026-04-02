require 'active_record'

DB_PATH = File.expand_path('orders.sqlite3', __dir__)

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: DB_PATH
)

if ActiveRecord::Base.connection.data_source_exists?(:orders)
  puts 'orders table already exists'
else
  # create table
  ActiveRecord::Schema.define do
    create_table :orders do |t|
      t.string :customer, null: false # t.string(:customer, null:false)の省略記法, メソッドの()を省略可
      t.integer :amount, null: false
      t.timestamps
    end
  end
  puts 'orders table created'
end
