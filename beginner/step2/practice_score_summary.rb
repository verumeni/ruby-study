scores = [55, 72, 88, 91, 67, 40, 79]
pass_line = 60

total = scores.sum
average = (total.to_f / scores.length).round(2)
max_score = scores.max
min_score = scores.min

pass_count = 0
scores.each do |x|
    pass_count += 1 if x >= pass_line # 1行で記載する記法 (if条件を満たした場合のみ式を評価)
end

result = {
    total_students: scores.length,
    pass_line: pass_line,
    pass_count: pass_count,
    fail_count: scores.length - pass_count,
    average: average,
    max_score: max_score,
    min_score: min_score
}

puts "--- Score Summary ---"
result.each do |k, v|
    puts "#{k}: #{v}"
end

puts "---  Grade Distribution ---"
scores.each do |score|
    rank = case score
        when 90..100 then "S" # 2点リーダー 90..100 90以上100以下
        when 80...90 then "A" # 3点リーダー 80...90 80以上90未満
        when 70...80 then "B"
        when 60...70 then "C"
        else "D"
        end

    puts "score #{score} => rank #{rank}"
end