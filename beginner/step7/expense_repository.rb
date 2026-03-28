require "json"
require_relative "expense"

class ExpenseRepository
    def initialize(path = "step7/expenses.json")
        @path = path
    end

    def all
        return [] unless File.exist?(@path)

        raw = File.read(@path)
        return [] if raw.strip.empty?

        JSON.parse(raw, symbolize_names: true).map { |h| Expense.from_h(h)}
    rescue JSON::ParserError
        []
    end

    def save_all(expenses)
        data = expenses.map(&:to_h) # &:to_h <=> {|h| h.to_h}
        File.write(@path, JSON.pretty_generate(data))
    end
end