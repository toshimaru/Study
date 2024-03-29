### Sort1 ###

def merge_sort1(ary)
    merge_sort(ary, 0, ary.length - 1)
end

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

### Sort2 ###

def merge_sort2(ary)
  return ary if ary.size <= 1

  mid = ary.size / 2
  ary1 = merge_sort2(ary[...mid])
  ary2 = merge_sort2(ary[mid..])
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

### Benchmarking ###

require 'benchmark/ips'

Benchmark.ips do |x|
    ARY = Array.new(500) { Random.rand }

    x.report("merge_sort1") { merge_sort1(ARY) }
    x.report("merge_sort2") { merge_sort2(ARY) }
    # x.report("Array#sort") { ARY.sort }
    x.compare!
end

=begin
❯ ruby ruby-bench.rb
Warming up --------------------------------------
         merge_sort1   225.000  i/100ms
         merge_sort2   283.000  i/100ms
Calculating -------------------------------------
         merge_sort1      2.356k (± 1.5%) i/s -     11.925k in   5.062369s
         merge_sort2      2.840k (± 1.4%) i/s -     14.433k in   5.083328s

Comparison:
         merge_sort2:     2839.9 i/s
         merge_sort1:     2356.2 i/s - 1.21x  slower
=end
