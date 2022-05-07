def _first_and_last_position(arr, target)
  head, tail = 0, arr.size - 1
  first_pos, last_pos = -1, -1

  while head < tail
    if arr[head] == target
      first_pos = last_pos = head
      while arr[first_pos] == arr[last_pos]
        last_pos += 1
      end
      last_pos -= 1
      break
    end

    if arr[tail] == target
      last_pos = first_pos = tail
      while arr[first_pos] == arr[last_pos]
        first_pos -= 1
      end
      first_pos += 1
      break
    end

    head += 1
    tail -= 1
  end

  [first_pos, last_pos]
end

def first_and_last_position(arr, target)
  return [-1, -1] if arr.empty? || arr[0] > target || arr[-1] < target
  first, last = find_first(arr, target), find_last(arr, target)
  [first, last]
end

def find_first(arr, target)
  return 0 if arr[0] == target

  low, high = 0, arr.size
  while low <= high
    mid = (low + high) / 2
    if arr[mid] == target && arr[mid - 1] < target
      return mid
    elsif arr[mid] < target
      low = mid + 1
    else
      high = mid - 1
    end
  end
  -1
end

def find_last(arr, target)
  return arr.size - 1 if arr[-1] == target

  low, high = 0, arr.size
  while low <= high
    mid = (low + high) / 2
    if arr[mid] == target && arr[mid + 1] > target
      return mid
    elsif arr[mid] > target
      high = mid - 1
    else
      low = mid + 1
    end
  end
  -1
end

p first_and_last_position([2,3,4,4,4,6,9], 4)
p first_and_last_position([2,3,4,4,4,6,9], 0)
p first_and_last_position([0,1,2,3,4,4,4,6,9], 0)
p first_and_last_position([2,3,4,4,4,6,9,9], 9)
p first_and_last_position([], 0)
p first_and_last_position([1,2,3], 0)
p first_and_last_position([1,2,3], 10)
