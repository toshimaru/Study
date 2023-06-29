def fibo(n)
  return n if n <= 1
  fibo(n-1) + fibo(n-2)
end

puts fibo(5)
puts '========'
puts fibonacci(5)
