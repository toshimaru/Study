# frozen_string_literal: true

class TreeNode
  attr_accessor :left, :right, :val

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def search(root, target)
  return if root.nil?

  if target > root.val
    search(root.right, target)
  elsif target < root.val
    search(root.left, target)
  else
    true
  end
end

def min_value_node(root)
  root = root.left while root.left
  root
end

def remove(root, val)
  return if root.nil?

  if val > root.val
    root.right = remove(root.right, val)
  elsif val < root.val
    root.left = remove(root.left, val)
  else
    return root.right if root.left.nil?
    return root.left if root.right.nil?

    min_node = min_value_node(root.right)
    root.val = min_node.val
    root.right = remove(root.right, min_node.val)
  end
  root
end
