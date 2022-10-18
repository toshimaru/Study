# Reference
# https://opendatastructures.org/ods-java/3_2_DLList_Doubly_Linked_Li.html
class Node
  attr_accessor :prev, :next, :value

  def initialize(value)
    @value = value
    @prev = nil
    @next = nil
  end

  # for debug
  def inspect
    { value:, prev: @prev.value, next: @next.value }
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

  def get_node(index)
    if index < size / 2
      index.times.inject(dummy.next) { |node| node.next }
    else
      (size - index).times.inject(dummy) { |node| node.prev }
    end
  end

  def get(index)
    raise ArgumentError.new('index out of range') if index < 0 || index > size - 1

    get_node(index).value
  end

  def set(index, value)
    raise ArgumentError.new('index out of range') if index < 0 || index > size - 1

    node = get_node(index)
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

  def add(index, value)
    add_before(get_node(index), value)
  end

  def remove(index)
    raise ArgumentError.new('index out of range') if index < 0 || index > size - 1

    node = get_node(index)
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
puts

list.set 1, 12
p list.get(0)
p list.get(1)
p list.get(2)
p list.get(3)
puts

list.remove 1
p list.get(0)
p list.get(1)
p list.get(2)
