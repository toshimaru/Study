# method(:puts)
# => #<Method: main.puts(*)>

ary = [1, 2, 3]

puts "=== 1 ==="
ary.each do |n|
  puts n
end

puts "=== 2 ==="
ary.map { |n| puts n }

puts "=== 3 ==="
ary.map(&method(:puts))
