# Atomic is deprecated:
# ref. https://github.com/ruby-concurrency/atomic#deprecated
#
# ```rb
# # old way
# require 'atomic'
# my_atomic = Atomic.new(0)
#
# # new way
# require 'concurrent'
# my_atomic = Concurrent::Atomic.new(0)
# ```

require 'concurrent/atomics'

@counter = Concurrent::AtomicReference.new(0)
100.times.inject([]) do |threads|
  threads << Thread.new do
    @counter.update { |current_value| current_value + 1 }
  end
end.map(&:join)
puts "counter.value: #{@counter.value}"
