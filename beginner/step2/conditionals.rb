score = 78
# if elsif else end
if score >= 90
    grade = "A"
elsif score >= 80
    grade = "B"
elsif score >= 70
    grade = "C"
elsif score >= 60
    grade = "D"
else
    grade = "F"
end

puts "score: #{score}, grade: #{grade}"

# unless ~ではない場合
is_weekend = false
unless is_weekend
    puts "今日は平日です"
end

language = "ruby"

message =
    case language
    when "ruby"
        "Rubyを学習中です"
    when "javascript"
        "JavaScriptを学習中です"
    else
        "別の言語を学習中です"
    end

puts message