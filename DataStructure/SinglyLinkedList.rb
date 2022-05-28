
class Node
  attr_accessor :next
  attr_reader :value

  def initialize(value)
    @value = value
  end
end

class SinglyLinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def add(value)
    node = Node.new(value)
    if @size == 0
      @head = node
    else
      @tail.next = node
    end
    @tail = node
    @size += 1
    true
  end

  def push(value)
    node = Node.new(value)
    node.next = head
    @head = node
    @tail = node if @size == 0
    @size += 1
    value
  end

  def pop
    return if (@size == 0)
    popped_val = head.value
    @head = head.next
    @size -= 1
    @tail = nil if @size == 0
    popped_val
  end

  alias_method :remove, :pop
end

### Test ###
linked_list = SinglyLinkedList.new
linked_list.push 1
linked_list.push 2
linked_list.add 3
p linked_list
linked_list.pop
p linked_list
linked_list.remove
linked_list.pop
p linked_list
