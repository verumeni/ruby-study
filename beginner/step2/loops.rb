puts "--- for ---"
for n in 1..5 do
    p n
end

puts "--- for break ---"
for n in 1..5 do
    p n
    if n == 3
        break
    end
end

# next 条件に一致する場合は以降の処理をスキップ (continue的な挙動)
puts "--- for next ---"
for n in 1..5 do
    next if n == 3
    p n
end

# while 条件がtrueの間のみ
puts "--- while ---"
count = 1
while count <= 3
    puts "while count: #{count}"
    count += 1
end

# until 条件がfalseの間のみ(~になるまで)
puts "--- until ---"
number = 1
until number > 3
    puts "until number: #{number}"
    number += 1
end

puts "--- each (array) ---"
fruits = ["apple", "banana", "orange"]
fruits.each_with_index do |fruit, index|
    puts "#{index}: #{fruit}"
end

puts "--- each (hash) ---"
profile = {name: "Taro", age: 30, city: "Tokyo"}
profile.each do |key, value|
    puts "#{key} => #{value}"
end

# loop breakを宣言するまでループし続ける
puts "--- loop ---"
number = 0
loop do
    p number
    number += 1
    if number >= 3
        break
    end
end

# times 任意の回数ループする
puts "--- times ---"
3.times do |number|
    p number
end

