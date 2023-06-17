def merge_sort(ary)
  return ary if ary.size <= 1

  mid = ary.size / 2
  ary1 = merge_sort(ary[...mid])
  ary2 = merge_sort(ary[mid..])
  merge2(ary1, ary2)
end

def merge2(ary1, ary2)
  i, j, merged_ary = 0, 0, []

  while i < ary1.size && j < ary2.size
    if ary1[i] < ary2[j]
      merged_ary << ary1[i]
      i += 1
    else
      merged_ary << ary2[j]
      j += 1
    end
  end

  while i < ary1.size
    merged_ary << ary1[i]
    i += 1
  end
  while j < ary2.size
    merged_ary << ary2[j]
    j += 1
  end
  merged_ary
end

p merge_sort([1,100,-1,10,2,11,33,88,44])
