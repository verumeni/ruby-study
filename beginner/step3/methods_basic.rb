# method 最後に実行された式を戻り値として返却, return; のように戻り値がない場合はnil
def great(name)
    "hello, #{name}"
end

def add(a, b)
    a + b
end

def grade(score)
    return "S" if score >= 90
    return "A" if score >= 80
    return "B" if score >= 70
    return "C" if score >= 60
    "D"
end

puts great("Taro")
puts "10 + 20 = #{add(10, 20)}"

# do ~ end => {|score| }でも可
[95, 82, 74, 61, 45].each do |score|
    puts "score: #{score}, grade: #{grade(score)}"
end