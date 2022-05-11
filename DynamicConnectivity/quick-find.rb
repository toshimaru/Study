# frozen_string_literal: true

=begin
quick-find Cost
- initialize: N
- union: N
- find: 1
=end

class QuickFind
  attr_reader :ids

  def initialize(n)
    @ids = n.times.to_a
  end
  
  def connected?(p, q)
    ids[p] == ids[q]
  end

  def union(p, q)
    orig_p = ids[p]
    orig_q = ids[q]
    ids.map! { |id| (id == orig_p) ? orig_q : id }
  end
end

qf = QuickFind.new(10)
p qf.ids
qf.union(3, 8)
p qf.ids
qf.union(5, 3)
p qf.ids
qf.union(5, 0)
p qf.ids

