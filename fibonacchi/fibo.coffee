fibo = (n) -> if n in [0, 1] then n else fibo(n-2) + fibo(n-1)

console.log(fibo(10))
