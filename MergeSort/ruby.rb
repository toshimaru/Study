# Big O time: O(n log n)

def merge_sort(ary, start, _end)
    return ary if _end - start + 1 <= 1

    mid = (start + _end) / 2
    merge_sort(ary, start, mid)
    merge_sort(ary, mid + 1, _end)
    merge(ary, start, mid, _end)
    ary
end

def merge(ary, start, mid, _end)
    left = ary[start..mid]
    right = ary[mid+1.._end]
    i,j,k = 0,0,start

    while i < left.length && j < right.length
        if left[i] <= right[j]
            ary[k] = left[i]
            i += 1
        else
            ary[k] = right[j]
            j += 1
        end
        k += 1
    end

    while i < left.length
        ary[k] = left[i]
        i += 1
        k += 1
    end
    while j < right.length
        ary[k] = right[j]
        j += 1
        k += 1
    end
end

p merge_sort([1,100,-1,10,2,11,33,88,44],0,8)
