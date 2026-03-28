require_relative "expense_repository"
require_relative "expense_service"

class CLI
    def initialize
        repo = ExpenseRepository.new
        @services = ExpenseService.new(repo)
    end

    def run
        loop do
            puts "\n=== Expense CLI ==="
            puts "1) 支出を追加"
            puts "2) 一覧表示"
            puts "3) 月別合計"
            puts "4) カテゴリ別合計"
            puts "5) 終了"
            print "選択: "
            choice = gets&.chomp

            case choice
            when "1" then add_expense
            when "2" then show_list
            when "3" then show_month_total
            when "4" then show_category_total
            when "5" then
                puts "終了します"
                break
            else
                puts "不正な入力です"
            end
        end
    end

    def add_expense
        print "カテゴリ: "
        category = gets&.chomp.to_s
        print "金額: "
        amount = gets&.chomp.to_s
        print "日付(YYYY-MM-DD): "
        date = gets&.chomp.to_s
        print "メモ(任意): "
        memo = gets&.chomp.to_s

        expense = @services.add(category: category, amount: amount, date: date, memo: memo)
        puts "追加しました: id=#{expense.id}"

    rescue ArgumentError => e
        puts "入力エラー: #{e.message}"
    rescue StandardError => e
        puts "予期しないエラー: #{e.class} #{e.message}"
    end

    def show_list
        expenses = @services.list
        if expenses.empty?
            puts "データがありません"
            return
        end

        expenses.each do |e|
            puts "[#{e.id}] #{e.date} #{e.category} #{e.amount}円 memo=#{e.memo}"
        end
    end

    def show_month_total
        print "対象月(YYYY-MM): "
        month = gets&.chomp.to_s
        total = @services.total_by_month(month)
        puts "#{month} の合計: #{total}円"
    end

    def show_category_total
        totals = @services.total_by_category
        if totals.empty?
            puts "データがありません"
            return
        end

        totals.each do |category, total|
            puts "#{category}: #{total}"
        end
    end
end