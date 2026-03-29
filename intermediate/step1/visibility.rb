class Score
    def initialize(value)
        @value = value
    end

    # ?を付けているのは真偽値を返却することを表す意図らしい（なくても問題動作はするっぽい。!も同じような命名規則で使用する用でこちらは破壊的操作を行うメソッドに付ける）
    def higher_than?(other)
        score > other.score
    end

    private
    def secret_message
        "private method"
    end

    protected
    def score
        @value
    end
end

a = Score.new(80)
b = Score.new(70)

puts a.higher_than?(b)

begin
    # protectedなので外部から呼べない
    puts a.score
rescue
    puts "score call error"
end

begin
    # privateなので外部から呼べない
    puts a.secret_message
rescue => ex
    puts "secret_message call error"
end