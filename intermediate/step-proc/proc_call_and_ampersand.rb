# call と & の使い方

double = -> (n) {n * 2}
puts "--- Proc lambda object ---"
puts "オブジェクト: #{double.inspect}"
puts "class: #{double.class}"
puts "lambda判定: #{double.lambda?}"
puts "引数個数: #{double.arity}"
puts "引数詳細: #{double.parameters}"
puts "定義元[path, line]: #{double.source_location}"

puts "--- 検証 ---"
numbers = [1, 2, 3]
result1 = numbers.map {|n| double.call(n)}
result2 = numbers.map(&double) # Proc(lambda)をブロックに展開
# ↑の補足として &:simbol のような記法もあるがそれは要素に対してsimbolのメソッドを実行するという意味

puts "result1: #{result1.inspect}"
puts "result2: #{result2.inspect}"