ary = [1, 2, 3]

p ary.map { |n| n.to_s }
p ary.map(&:to_s)
