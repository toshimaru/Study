# ref. http://www.geocities.jp/m_hiroi/light/abcruby13.html

class Tree

  class Node
    def initialize(key, data)
      @key = key
      @data = data
      @left = nil
      @right = nil
    end
    attr_accessor :key, :data, :left, :right
  end

  def initialize
    @root = nil
  end

  private

  def search(node, key)
    while node
      if key == node.key
        return node
      elsif key < node.key
        node = node.left
      else
        node = node.right
      end
    end
  end
  
  def insert!(node, key, data)
    if node == nil
      return Node.new(key, data)
    elsif key == node.key
      node.data = data
    elsif key < node.key
      node.left = insert!(node.left, key, data)
    else
      p node
      node.right = insert!(node.right, key, data)
      p node
    end
    node
  end

  def serach_min(node)
    node = node.left while node.left
    node
  end
  
  def delete_min!(node)
    return node.right unless node.left
    node.left = delete_min!(node.left)
    node
  end

  def delete!(node, key)
    data = nil
    if node
      if key == node.key
        data = node.data
        if node.left == nil
          return node.right, data
        elsif node.right == nil
          return node.left, data
        else
          min_node = search_min(node.right)
          node.key = min_node.key
          node.data = min_node.data
          node.right = delete_min!(node.right)
        end
      elsif key < node.key
        node.left, data = delete!(node.left, key)
      else
        node.right, data = delete!(node.right, key)
      end
    end
    return node, data
  end

  def traverse(node, &func)
    if node
      traverse(node.left, &func)
      func.call(node.key, node.data)
      traverse(node.right, &func)
    end
  end

  public

  # search
  def [](key)
    node = search(@root, key)
    if node
      node.data
    end
  end
  
  # insert
  def []=(key, value)
    @root = insert!(@root, key, value)
    value
  end
  
  def delete_key!(key)
    @root, value = delete!(@root, key)
    value
  end
  
  def min
    if @root
      node = search_min(@root)
      if node
        [node.key, node.data]
      end
    end
  end
  
  def max
    if @root
      node = search_max(@root)
      if node
        [node.key, node.data]
      end
    end
  end
  
  # 巡回
  def each(&func)
    traverse(@root, &func)
  end

  def inspect
    sprintf("#<Tree:%#x>", self.object_id)
  end

end

t = Tree.new

# p t[1] = 'hoge'
# p t[2] = 'fuga'
# p t[1.5] = 'foo'

10.times { |x|
  key = rand
  t[key] = x
}

t.each { |k, v|
  print k, ' ', v, "\n"
}

# print t[100]
# t[100] = 10
# print t[100]

# t.each { |k, v|
#   print k, ' ', v, "\n"
# }

