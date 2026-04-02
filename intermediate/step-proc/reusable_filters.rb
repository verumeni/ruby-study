# map/select/reduce と Proc の組み合わせ

numbers = [10, 15, 20, 25, 30]

even_filter = ->(n) {n.even?}
tax_proc = ->(n) {(n * 1.1).round}
sum_proc = ->(sum, n) {sum + n}

# &記法はProcに対してコレクション要素を引数に渡すためlambdaの場合引数の数が一致しない場合に例外となるため注意
evens = numbers.select(&even_filter)
taxed = evens.map(&tax_proc)
total = taxed.reduce(0, &sum_proc)

puts "evens: #{evens.inspect}"
puts "taxed: #{taxed.inspect}"
puts "total: #{total}"