def bubble_sort1(ary)
  len = ary.length - 1
  (0...len).each do |i|
    (0...len-i).each do |j|
      if ary[j] > ary[j + 1]
        ary[j], ary[j + 1] = ary[j + 1], ary[j] 
      end
    end
  end
  ary
end

def bubble_sort2(ary)
  len = ary.length - 1
  len.times do |x|
    (len - x).times do |y|
      if ary[y] > ary[y + 1]
        ary[y], ary[y + 1] = ary[y + 1], ary[y]
      end
    end
  end
  ary
end

array = Array.new(10) { rand(10) }
p array
p bubble_sort1(array)
p bubble_sort2(array)
