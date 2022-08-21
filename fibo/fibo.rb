def fibo(n)
  return n if n == 0 || n == 1
  fibo(n-2) + fibo(n-1)
end

def fibonacci(n)
  a, b = 0, 1
  n.times do
    a, b = b, a + b
  end
  a
end

def fibonacci_array(n)
  (2...n).inject([0, 1]) { |ary, i|
    ary << (ary[i - 2] + ary[i - 1])
  }
end

p fibonacci_array(11)
puts fibo(10)
puts fibonacci(10)
