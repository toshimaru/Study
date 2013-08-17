
def fibo(n)
  return n if (0..1).include? n
  fibo(n-2) + fibo(n-1)
end

p fibo(30)

