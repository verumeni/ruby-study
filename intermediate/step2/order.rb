class Order
    attr_reader :id, :customer, :amount

    def initialize(id:, customer:, amount:)
        @id = id
        @customer = customer
        @amount = amount
    end

    def to_h
        { id: @id, customer: @customer, amount: @amount }
    end

    def self.from_h(hash)
        new(id: hash[:id], customer: hash[:customer], amount: hash[:amount])
    end
end