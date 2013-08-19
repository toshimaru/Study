
def qsort(ary)
    return ary if ary.length.zero?
    pivot = ary.shift
    qsort(ary.select{|i| i < pivot}) + [pivot] + qsort(ary.select{|i| i >= pivot})
end

array = []
10.times{ array.push(rand(100)) }

p array
p qsort(array)
