class Node
  attr_accessor :prev, :next, :value

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
    raise ArgumentError.new("index out of range") if (i < 0 || i > size - 1)

    get_node(i).value
  end

  def set(i, value)
    raise ArgumentError.new("index out of range") if (i < 0 || i > size - 1)

    node = get_node(i)
    original_value = node.value
    node.value = value
    original_value
  end

  def add_before(node, value)
    new_node = Node.new(value)
    new_node.prev = node.prev
    new_node.next = node
    new_node.next.prev = new_node
    new_node.prev.next = new_node
    @size += 1
    new_node
  end

  def add(i, value)
    add_before(get_node(i), value)
  end

  def remove(i)
    raise ArgumentError.new("index out of range") if (i < 0 || i > size - 1)

    node = get_node(i)
    remove_node(node)
    node.value
  end

  def remove_node(node)
    node.prev.next = node.next
    node.next.prev = node.prev
    @size -= 1
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

list.set 1, 12
p list.get(1)

list.remove 1
p list.get(0)
p list.get(1)
p list.get(2)
