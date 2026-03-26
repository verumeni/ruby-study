require "minitest/autorun"
require "fileutils"
require_relative "../step5/json_store"

class JsonStoreTest < Minitest::Test
    TMP_DIR = "step6/tmp"
    TEST_FILE = "#{TMP_DIR}/data.json"

    # テスト開始時に実行
    def setup
        FileUtils.mkdir_p(TMP_DIR)
        File.delete(TEST_FILE) if File.exist?(TEST_FILE)
        @store = JsonStore.new(TEST_FILE)
    end

    # テスト終了後に実行
    def teardown
        File.delete(TEST_FILE) if File.exist?(TEST_FILE)
    end

    # test_ テストケース
    # ファイル読取
    def test_load_array_returns_empty_when_file_not_exists
        # 比較テスト
        assert_equal [], @store.load_array
    end

    # json保存 => 読取テスト
    def test_save_and_load_array
        data = [{ id: 1, title: "task", done: false}]
        assert_equal true, @store.save_array(data)

        loaded = @store.load_array
        assert_equal 1, loaded.size
        assert_equal 1, loaded[0][:id]
        assert_equal "task", loaded[0][:title]
        assert_equal false, loaded[0][:done]
    end

    # jsonパース失敗テスト
    def test_load_array_returns_empty_when_json_is_invalid
        File.write(TEST_FILE, "{invalid json")
        assert_equal [], @store.load_array
    end
end