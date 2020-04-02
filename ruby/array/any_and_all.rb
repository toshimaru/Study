def any_check(ary)
  ary.any? do |num|
    puts num
    num.odd?
  end
end

puts "# any check"
p any_check([2,4,6,10,12,20,22])
p any_check([2,4,6,10,11,12,20,22])

def all_check(ary)
  ary.all? do |num|
    puts num
    num.even?
  end
end

puts "# all check"
p all_check([2,4,6,10,12,20,22])
p all_check([2,4,6,10,11,12,20,22])
