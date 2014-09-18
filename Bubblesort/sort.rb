
def bubble_sort(ary)
    n = ary.length - 1
    (0...n).each { |i|
        (0...n-i).each { |j| 
            ary[j], ary[j + 1] = ary[j + 1], ary[j] if ary[j] > ary[j + 1]
        }
    } 
    ary
end


array = [4, 3, 2, 1, 0]
p bubble_sort(array)

