require "minitest/autorun"
require "fileutils"
require_relative "expense_repository"
require_relative "expense_service"

class ExpenseServiceTest < Minitest::Test
    TMP_DIR = "step7/tmp"
    FILE_PATH = "#{TMP_DIR}/expenses_test.json"

    def setup
        FileUtils.mkdir_p(TMP_DIR)
        File.delete(FILE_PATH) if File.exist?(FILE_PATH)
        repo = ExpenseRepository.new(FILE_PATH)
        @service = ExpenseService.new(repo)
    end

    def teardown
        File.delete(FILE_PATH) if File.exist?(FILE_PATH)
    end

    def test_add_and_list
        @service.add(category: "food", amount: 1200, date: "2026-03-28", memo: "lunch")
        @service.add(category: "book", amount: 2000, date: "2026-03-28")

        list = @service.list
        assert_equal 2, list.size
        assert_equal "food", list[0].category
        assert_equal 1200, list[0].amount
    end

    def test_total_by_month_and_category
        @service.add(category: "food", amount: 1000, date: "2026-03-01")
        @service.add(category: "food", amount: 1500, date: "2026-03-10")
        @service.add(category: "book", amount: 2000, date: "2026-04-01")

        assert_equal 2500, @service.total_by_month("2026-03")
        assert_equal 2000, @service.total_by_month("2026-04")

        totals = @service.total_by_category
        assert_equal 2500, totals["food"]
        assert_equal 2000, totals["book"]
    end

    def test_add_raises_when_invalid

        # 例外テスト category empty
        assert_raises(ArgumentError) do
            @service.add(category: "", amount: 1000, date: "2026-03-28")
        end

        # amount is zero
        assert_raises(ArgumentError) do
            @service.add(category: "food", amount: 0, date: "2026-03-28")
        end

        # date format error
        assert_raises(ArgumentError) do
            @service.add(category: "food", amount: 1000, date: "2026/03/28")
        end
  end
end