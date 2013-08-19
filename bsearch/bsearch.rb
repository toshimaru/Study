#
# binary search
# ref. http://www.geocities.jp/m_hiroi/light/ruby02.html
#

def bsearch(x, buff)
  low = 0
  high = buff.size - 1
  while low <= high
    mid = (low + high) / 2
    if x == buff[mid] 
      return true
    elsif x > buff[mid]
      low = mid + 1
    else
      high = mid - 1
    end
  end
  false
end

# test
if __FILE__ == $0
  a = (1 ... 5).to_a
  for x in [0, 1, 2.5, 3, 4, 5]
    print x, " ", bsearch(x, a), "\n"
  end
end
