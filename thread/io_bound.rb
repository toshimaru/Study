require 'benchmark'
require 'open-uri'

URL = 'https://www.nytimes.com/'
ITERATIONS = 30

def fetch_url(thread_count)
  threads = []

  thread_count.times do
    threads << Thread.new do
      fetches_per_thread = ITERATIONS / thread_count
      fetches_per_thread.times { URI.open(URL) }
    end
  end

  threads.each(&:join)
end

Benchmark.bm(20) do |bm|
  [1, 2, 3, 4, 5, 6, 10, 15].each do |thread_count|
    bm.report("with #{thread_count} threads") do
      fetch_url(thread_count)
    end
  end
end
