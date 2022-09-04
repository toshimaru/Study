# @param ary: array of integers
# @param target: integer
# @return boolean
def bsearch(ary, target)
  head = 0
  tail = ary.size - 1
  while head <= tail
    mid = (head + tail) / 2
    if target == ary[mid]
      return true
    elsif target > ary[mid]
      head = mid + 1
    else
      tail = mid - 1
    end
  end
  false
end

# test
ary = (1..4).to_a
[0, 1, 2.5, 3, 4, 5].each do |target|
  puts "ary: #{ary}, target: #{target}, result: #{bsearch(ary, target)}"
end
