def fibo(n)
  return n if n == 0 || n == 1
  fibo(n-2) + fibo(n-1)
end

def fibo2(n)
  result, a, b = 0, 0, 1
  n.times do
    result = a
    a, b = b, a + b
    puts result
  end
  puts result
end

10.times { |i|
  puts fibo(i)
}

fibo2(10)
