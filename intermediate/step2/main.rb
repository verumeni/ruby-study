require_relative "order_repository"
require_relative "discount_policy"
require_relative "order_service"

# DI
repo = OrderRepository.new
policy = DiscountPolicy.new(threshold: 5000, rate: 0.1)
service = OrderService.new(repository: repo, discount_policy: policy)

service.place_order(customer: "Taro", amount: 3000)
service.place_order(customer: "Hanako", amount: 8000)

service.list_orders.each do |x|
    puts "[#{x.id}] customer=#{x.customer} amount=#{x.amount}"
end