def qsort(ary)
  return ary if ary.length.zero?
  pivot = ary.shift
  qsort(ary.select{|i| i < pivot}) + [pivot] + qsort(ary.select{|i| i >= pivot})
end

ary = Array.new(10) { rand(100) }
p ary
p qsort(ary)
