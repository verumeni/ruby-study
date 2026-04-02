# Procとlambdaの違い

normal_proc = Proc.new { |a, b| "proc: a=#{a}, b=#{b}"}
strict_lambda = lambda do |a, b|
  "lambda: a=#{a}, b=#{b}"
end
short_lambda = -> (a, b) { "lambda: a=#{a}, b=#{b}" }

puts normal_proc.call(1)
puts strict_lambda.call(1, 2)
# puts strict_lambda.call(1) # ArgumentError lambdaの場合引数の数も厳密に指定する必要あり
puts short_lambda.call(1, 2)

def proc_return_test
  # Proc内でreturnを使うと呼び出されたメソッドに対するreturnとなってしまうのでreturnの使用は不可
  p = Proc.new{ return "proc return" }
  p.call
  "after proc"
end

def lambda_return_test
  # lambda内でのreturnはProcと違って安全に使用可能
  l = ->{ return "lambda return" }
  result = l.call
  "after lambda(#{result})"
end

puts proc_return_test
puts lambda_return_test