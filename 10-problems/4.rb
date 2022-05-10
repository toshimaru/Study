def _nth_largest(arr, n)
  arr.sort[n]
end

def nth_largest(arr, n)
  quicksort(arr)[n - 1]
end

def quicksort(arr)
  return arr if arr.size <= 1

  pivot = arr.pop
  greater, lesser = [], []
  arr.each do |num|
    if num > pivot
      greater << num
    else
      lesser << num
    end
  end
  quicksort(greater) + [pivot] + quicksort(lesser)
end

p nth_largest([4,2,9,7,5,1], 3)
p nth_largest([], 1)
p nth_largest([1], 1)
p nth_largest([1], 2)
