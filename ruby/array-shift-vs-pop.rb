require 'benchmark/ips'

Benchmark.ips do |x|
    ARY = Array.new(1_000_000) { Random.rand }

    x.report("shift") do
        a = ARY.dup
        1_000_000.times { a.shift }
    end
    x.report("pop") do
        a = ARY.dup
        1_000_000.times { a.pop }
    end
end
