def rec(a, b)
  puts "a = #{a} / b = #{b}"
  return 0 if a < 1 || b < 1

  a + b + rec(a-1, b) + rec(a, b-1)
end

rec(3,3)
