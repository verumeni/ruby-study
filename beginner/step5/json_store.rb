require "json"

class JsonStore
    def initialize(path)
        @path = path
    end

    def load_array
        return [] unless File.exist?(@path)

        raw = File.read(@path)
        return [] if raw.strip.empty?

        JSON.parse(raw, symbolize_names: true)

    rescue JSON::ParserError => e
        puts "[ERROR] JSONの解析に失敗しました: #{e.message}"
        []
    rescue StandardError => e
        puts "[ERROR] 読み込み中に予期しないエラー: #{e.message}"
        []
    end

    def save_array(data)
        File.write(@path, JSON.pretty_generate(data))
        true
    rescue StandardError => e
        puts "[ERROR] 保存に失敗しました: #{e.class} #{e.message}"
        false
    ensure
        puts "[INFO] save_array finished"
    end
end