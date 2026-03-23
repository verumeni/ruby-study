# 配列
numbers = [10, 20, 30, 10]

# 追加 << 又は push
numbers << 40
numbers.push(50)

# 変更
numbers[1] = 25

# 連番(引数の型がそろっていないと正しく動作しない可能性あり、挙動に注意)
to_arr = (1..5).to_a
to_alpha = ("a".."f").to_a

# 出力に関しては主に以下のものが用意されている
# puts 標準の文字列出力 改行あり
# print putsの改行無し
# p inspect出力 オブジェクトと型表現も含めた形で出力 改行あり
puts "numbers: #{numbers.inspect}" # inspect 標準出力する際に配列やhashをわかりやすい形で返却してくれるもの
puts "first: #{numbers.first}"
puts "last: #{numbers.last}"
puts "to_arr: #{to_arr}"
puts "to_alpha: #{to_alpha}"

# 削除 値を引数に削除 又は [index, 個数]でまとめて削除
# 値を指定して削除する場合指定した値が配列の中に複数存在する場合すべて削除されてしまうようだった
arr_numbers = (1..5).to_a
arr_numbers.delete(1)
puts "delete: #{arr_numbers.inspect}"

arr_numbers[0, 2] = []
puts "[0, 2] = []: #{arr_numbers.inspect}"

arr_numbers.pop # 末尾削除
puts "pop: #{arr_numbers.inspect}"

arr_numbers.unshift(1) # 先頭追加
puts "unshift: #{arr_numbers.inspect}"

arr_numbers.shift # 先頭削除
puts "shift: #{arr_numbers.inspect}"

# 挿入
numbers.insert(1, 777)

puts "numbers: #{numbers.inspect}"
puts "sum: #{numbers.sum}"
puts "average: #{numbers.sum.to_f / numbers.length}"

# sort
numbers = [10, 5, 25, 40, 30, 35];
asc = numbers.sort
puts "asc: #{asc.inspect}"

desc = numbers.sort{|a, b| b<=>a}
puts "desc: #{desc.inspect}"

# 配列結合
strings = ("a".."f").to_a
numbers.concat(strings)

puts "numbers: #{numbers.inspect}"

# 文字列結合
puts "strings join: #{strings.join(',')}"

# ハッシュリスト
user = {
    name: "Taro",
    age: 30,
    skills: ["Ruby", "SQL"]
}

puts "name: #{user[:name]}"
puts "skills: #{user[:skills].join(',')}"

user[:city] = "Tokyo"
user[:age] = 29

puts "updated user: #{user.inspect}"

# hashを使った集計(単語数カウント)
text = "ruby study ruby hash array ruby"
counts = {}

text.split.each do |word|
    counts[word] ||= 0
    counts[word] += 1
end

puts "word counts: #{counts.inspect}"
