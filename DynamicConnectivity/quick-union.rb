# frozen_string_literal: true

=begin
quick-union
- lazy approach

quick-union Cost
- initialize: N
- union: N (includes finding roots cost)
- find: N
=end

class QuickUnion
  attr_reader :ids

  def initialize(n)
    @ids = n.times.to_a
  end
  
  def connected?(p, q)
    root(p) == root(q)
  end

  def union(p, q)
    root_p = root(p)
    root_q = root(q)
    ids[root_p] = root_q
  end

  private

  def root(i)
    i = ids[i] while i != ids[i]
    i
  end
end

qf = QuickUnion.new(10)
p qf.ids
qf.union(3, 8)
p qf.ids
qf.union(5, 3)
p qf.ids
qf.union(5, 0)
p qf.ids
p qf.connected?(3,0)
p qf.connected?(3,8)
