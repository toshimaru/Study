# frozen_string_literal: true

def generate(n)
  @stack = []
  rec(2*n, 0, [])
  @stack
end

def rec(n, diff, comb)
  return if diff < 0 || diff > n
  return @stack << comb.join if n == 0 && diff == 0

  rec(n-1, diff+1, comb + ['('])
  rec(n-1, diff-1, comb + [')'])
end

############

p generate(1)
p generate(2)
p generate(3)
p generate(4)
