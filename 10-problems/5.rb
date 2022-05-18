# frozen_string_literal: true

class Root
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def symmetric_root?(root)
  symmetric?(root.left, root.right)
end

def symmetric?(root1, root2)
  return true if root1.nil? && root2.nil?
  return false if root1.nil? ^ root2.nil?
  return false unless symmetric?(root1.left, root2.right)
  return false unless symmetric?(root1.right, root2.left)

  root1.val == root2.val
end

###############

[
  Root.new(1),
  Root.new(1),
  Root.new(1, Root.new(3), Root.new(2)),
  Root.new(1, nil, Root.new(2)),
  Root.new(1, Root.new(4), Root.new(4)),
  Root.new(1, Root.new(3), Root.new(2, nil, Root.new(4))),
  Root.new(1, Root.new(2, nil, Root.new(4)), Root.new(2, Root.new(4), nil)),
  Root.new(1, Root.new(2, nil, Root.new(4)), Root.new(2, nil, Root.new(4))),
  Root.new(1, Root.new(2, nil, Root.new(4, Root.new(3), nil)), Root.new(2, Root.new(4, nil, Root.new(3)), nil)),
].each do |root|
  puts symmetric_root?(root)
end
