require_relative "order"

class OrderService
    def initialize(repository:, discount_policy:)
        @repository = repository
        @discount_policy = discount_policy
    end

    def place_order(customer:, amount:)
        validate!(customer: customer, amount: amount)

        discounted_amount = @discount_policy.apply(amount.to_i)
        order = Order.new(
            id: @repository.next_id,
            customer: customer.strip,
            amount: discounted_amount
        )
        @repository.add(order)
        order
    end

    def list_orders
        @repository.all
    end

    private

    # 例外をthrowするような強い副作用があるので!を関数名に付与
    def validate!(customer:, amount:)
        raise ArgumentError, "customerは必須です" if customer.to_s.strip.empty?
        raise ArgumentError, "amountは1以上の整数にしてください" if amount.to_i <= 0
    end
end