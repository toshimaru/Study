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

require 'benchmark/ips'
Benchmark.ips do |x|
  SAMPLE_NUMS = (10..30).to_a.sample(5).freeze

  x.report("fibonacci_array") do
    SAMPLE_NUMS.each { |n| fibonacci_array(n+1) }
  end
  x.report("fibonacci") do
    SAMPLE_NUMS.each { |n| fibonacci(n) }
  end
  x.report("fibo") do
    SAMPLE_NUMS.each { |n| fibo(n) }
  end

  x.compare!
end
