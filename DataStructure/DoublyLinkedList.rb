class Node
  attr_reader :value
  attr_accessor :prev, :next

  def initialize(value)
    @value = value
    @prev = nil
    @next = nil
  end

  # for debug
  def inspect
    { value:, prev: @prev.value, next: @next.value}
  end
end

class DoublyLinkedList
  attr_reader :size, :dummy

  def initialize
    @dummy = Node.new(nil)
    @dummy.next = @dummy
    @dummy.prev = @dummy
    @size = 0
  end
  
  def get_node(i)
    if i < size / 2
      i.times.inject(dummy.next) { |node| node.next }
    else
      (size - i).times.inject(dummy) { |node| node.prev }
    end
  end
  
  def get(i)
    get_node(i).value
  end

  def set(i, value)
    # TODO
  end

  def add_before(node, value)
    n = Node.new(value)
    n.prev = node.prev
    n.next = node
    n.next.prev = n
    n.prev.next = n
    @size += 1
    n
  end

  def add(i, value)
    add_before(get_node(i), value)
  end

  def remove(i)
    # TODO
  end
end

list = DoublyLinkedList.new
list.add 0, 10
list.add 1, 20
list.add 2, 30
list.add 1, 11
p list.get(0)
p list.get(1)
p list.get(2)
p list.get(3)
p list.get(4)
