ary = Array.new(10_000) { rand(1...100_000_000) }.freeze
hash = ary.to_h {|n| [n, n] }.freeze
# p ary.take(10)
# p hash.take(10).to_h
RANDOM_NUMBERS = Array.new(10_000) { rand(1...100_000_000)  }.freeze

require 'benchmark'
Benchmark.bm 10 do |r|
  r.report "Array" do
    RANDOM_NUMBERS.each do |n|
      ary.include? n
    end
  end
  r.report "Hash" do
    RANDOM_NUMBERS.each do |n|
      hash.key? n
    end
  end
end
