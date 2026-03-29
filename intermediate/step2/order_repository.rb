class OrderRepository
    def initialize
        @orders = []
    end

    def all
        @orders
    end

    def add(order)
        @orders << order
    end

    def next_id
        (@orders.map(&:id).max || 0) + 1
    end
end