class Expense
    attr_reader :id, :category, :amount, :date, :memo

    def initialize(id:, category:, amount:, date:, memo: "")
        @id = id
        @category = category
        @amount = amount
        @date = date
        @memo = memo
    end

    def to_h
        {
            id: @id,
            category: @category,
            amount: @amount,
            date: @date,
            memo: @memo
        }
    end

    def self.from_h(hash)
        new(
            id: hash[:id],
            category: hash[:category],
            amount: hash[:amount],
            date: hash[:date],
            memo: hash[:memo] || ""
        )
    end
end