require "date"
require_relative "expense"

class ExpenseService
    def initialize(repository)
        @repository = repository
    end

    def add(category:, amount:, date:, memo: "")
        validate!(category: category, amount: amount, date: date)

        expenses = @repository.all
        next_id = (expenses.map(&:id).max || 0) + 1 # || はnilの場合に0を返却
        expense = Expense.new(
            id: next_id,
            category: category.strip,
            amount: amount.to_i,
            date: date,
            memo: memo
        )
        expenses << expense # 配列の末尾に追加.pushと同じ動作
        @repository.save_all(expenses)
        expense
    end

    def list
        @repository.all
    end

    def total_by_month(month)
        @repository
        .all
        .select {|e| e.date.start_with?(month)}
        .sum(&:amount)
    end

    def total_by_category
        result = Hash.new(0)
        @repository.all.each do |e|
            result[e.category] += e.amount
        end
        result
    end

    private # 非公開

    def validate!(category:, amount:, date:)
        raise ArgumentError, "categoryは必須です" if category.to_s.strip.empty?
        raise ArgumentError, "amountは1以上の整数にしてください" if amount.to_i <= 0

        Date.iso8601(date) # 不正フォーマット時に例外
    rescue Date::Error
        raise ArgumentError, "dateはYYYY-MM-DD形式にしてください"
    end
end