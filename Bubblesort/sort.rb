
def bubble_sort(ary)
  n = ary.length - 1
  (0...n).each { |i|
    (0...n-i).each { |j| 
      ary[j], ary[j + 1] = ary[j + 1], ary[j] if ary[j] > ary[j + 1]
    }
  } 
  ary
end

def bubblesort(ary)
  l = ary.length - 1
  l.times do |x|
    (l-x).times do |y|
      if ary[y] > ary[y + 1]
        ary[y], ary[y + 1] = ary[y + 1], ary[y]
      end
    end
  end
  ary
end


array = [4, 3, 2, 1, 0]
p bubble_sort(array)
p bubblesort(array)

