# ブロック付メソッド yield
def repeat(times)
    return unless block_given? # block_given? ブロックが作成されているか判定(組み込みモジュール)
    i = 0
    while i < times
        yield(i)
        i += 1
    end
end


repeat(3) {|index|
    puts "repeat index: #{index}"
}

def with_message(message)
    puts "[start] #{message}"
    if block_given?
        result = yield
        puts "[end] result=#{result}"
    else
        puts "[end] no block"
    end
end

with_message("calc") do
    10 * 5
end

# block nil
with_message("no block")