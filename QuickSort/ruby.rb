def qsort1(ary)
  return ary if ary.length.zero?
  pivot = ary.shift
  qsort1(ary.select{|i| i < pivot}) + [pivot] + qsort1(ary.select{|i| i >= pivot})
end

def qsort2(ary)
  return ary if ary.length <= 1
  pivot = ary.shift
  qsort2(ary.select{|i| i < pivot}) + [pivot] + qsort2(ary.select{|i| i >= pivot})
end

def qsort2(ary)
  return ary if ary.length <= 1
  pivot = ary.shift
  qsort2(ary.select{|i| i < pivot}) + [pivot] + qsort2(ary.select{|i| i >= pivot})
end

def qsort3(ary)
  return ary if ary.length <= 1
  pivot = ary.delete_at(rand(ary.length))
  qsort3(ary.select{|i| i < pivot}) + [pivot] + qsort3(ary.select{|i| i >= pivot})
end

def qsort4(ary)
  return ary if ary.length <= 1
  pivot = ary.delete_at(rand(ary.length))
  lesser, greater = ary.partition{|i| i < pivot}
  qsort4(lesser) + [pivot] + qsort4(greater)
end

# ary = Array.new(30) { rand(100) }
# ary1, ary2, ary3 = ary.dup, ary.dup, ary.dup
# p "original: #{ary}"
# p qsort1(ary)
# p qsort2(ary1)
# p qsort3(ary2)
# p qsort4(ary3)

require 'benchmark/ips'
Benchmark.ips do |x|
  ary1 = Array.new(10_000) { rand(10_000) }
  ary2 = Array.new(3) { rand(10000) }
  ary3 = (1..300).to_a.reverse
  x.report("qsort1") {
    qsort1(ary1)
    qsort1(ary2)
    qsort1(ary3)
  }
  x.report("qsort2") {
    qsort2(ary1)
    qsort2(ary2)
    qsort2(ary3)
  }
  x.report("qsort3") {
    qsort3(ary1)
    qsort3(ary2)
    qsort3(ary3)
  }
  x.report("qsort4") {
    qsort4(ary1)
    qsort4(ary2)
    qsort4(ary3)
  }
  x.compare!
end
