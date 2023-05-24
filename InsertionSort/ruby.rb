# Big-O Time: O(n^2)

def insertion_sort(ary)
	(1...ary.size).each do |i|
		j = i - 1
		while j >= 0 && ary[j + 1] < ary[j]
			ary[j], ary[j+1] = ary[j+1], ary[j]
			j -= 1
		end
	end
	ary
end

p insertion_sort([3,2,1,5,6,4])
p insertion_sort([3])
p insertion_sort([1,2,0])
