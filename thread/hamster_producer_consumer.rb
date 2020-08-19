require 'hamster/deque'
require 'concurrent/atomics'

@queue_wrapper = Concurrent::AtomicReference.new(Hamster::Deque.new)
30.times do
  @queue_wrapper.update { |queue| queue.enqueue(rand(100)) }
end

consumers = []

3.times do
  consumers << Thread.new do
    10.times do
      number = nil
      @queue_wrapper.update { |queue|
        number = queue.first
        queue.dequeue
      }
      puts "The cubed root of #{number} is #{Math.cbrt(number)}"
    end
  end
end

consumers.each(&:join)
