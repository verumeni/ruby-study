scores = [55, 72, 88, 91, 67, 40, 79]

# map: 各要素を変換
scaled = scores.map {|s| s + 5}
puts "scaled: #{scaled}"

# select: 条件 filter
passed = scores.select {|s| s >= 60}
puts "passed: #{passed}"

# reduce: 集約
total = scores.reduce(0) {|sum, s| sum + s}
average = (total.to_f / scores.length).round(2)
puts "total: #{total}, average: #{average}"

ranks = scores.map do |score|
    case score
    when 90..100 then "S"
    when 80...90 then "A"
    when 70...80 then "B"
    when 60...70 then "C"
    else "D"
    end
end

puts "ranks: #{ranks}"

students = [
    { name: "Taro", score: 78 },
    { name: "Hanako", score: 92 },
    { name: "Jiro", score: 59 }
]

# score >= 60に該当する生徒の名称の配列を返却
passed_names = students
.select {|student| student[:score] >= 60}
.map {|student| student[:name]}

puts "passed students: #{passed_names}"