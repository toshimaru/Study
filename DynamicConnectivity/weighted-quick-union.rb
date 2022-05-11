# frozen_string_literal: true

=begin
weighted-quick-union

quick-union Cost
- initialize: N
- union: Log N (includes finding roots cost)
- find: Log N
=end

class WeightedQuickUnion
  attr_reader :ids, :size

  def initialize(n)
    @ids = n.times.to_a
    @size = Array.new(n, 1)
  end
  
  def connected?(p, q)
    root(p) == root(q)
  end

  def union(p, q)
    root_p = root(p)
    root_q = root(q)
    return if root_p == root_q

    if size[root_p] < size[root_q]
      ids[root_p] = root_q
      size[root_q] += size[root_p]
    else
      ids[root_q] = root_p
      size[root_p] += size[root_q]
    end
  end

  private

  def root(i)
    i = ids[i] while i != ids[i]
    i
  end
end

qf = WeightedQuickUnion.new(10)
p qf.ids
qf.union(3, 8)
p qf.ids
qf.union(5, 3)
p qf.ids
qf.union(5, 0)
p qf.ids
p qf.connected?(3,0)
p qf.connected?(3,8)
