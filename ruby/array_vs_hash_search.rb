ary = Array.new(10_000) { rand(1...100_000_000) }.freeze
hash = ary.each_with_object({}) {|h, n| n[h] = h }.freeze

require 'benchmark'

random_numbers = Array.new(10_000) { rand(1...100_000_000)  }.freeze

Benchmark.bm 10 do |r|
  r.report "Array" do
    random_numbers.each do |n|
      ary.include? n
    end
  end
  r.report "Hash" do
    random_numbers.each do |n|
      hash[n]
    end
  end
end
