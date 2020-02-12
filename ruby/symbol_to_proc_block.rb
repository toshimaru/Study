# :to_s.to_proc
# => #<Proc:0x00007f814796ee00(&:to_s)>

ary = [1, 2, 3]

p ary.map { |n| n.to_s }
p ary.map(&:to_s)
