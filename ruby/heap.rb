# frozen_string_literal: true

class Heap
  def initialize
    @heap = [0]
  end

  def push(val)
    @heap << val
    i = @heap.size - 1

    while @heap[i] < @heap[i/2]
      @heap[i], @heap[i/2] = @heap[i/2], @heap[i]
      i = i / 2
    end
  end

  def pop
    return if @heap.size == 1
    return @head.pop if @heap.size == 2

    res = @heap[1]
    i = 1
    # Percolate down
    while 2 * i < @heap.size
      min_child = @heap[2 * i] < @heap[2 * i + 1] ? 2 * i : 2 * i + 1
      if @heap[i] > @heap[min_child]
        @heap[i], @heap[min_child] = @heap[min_child], @heap[i]
        i = min_child
      else
        break
      end
    end
  end
end
