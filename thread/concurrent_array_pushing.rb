puts "concurrent without mutex"

shared_ary = Array.new

10.times.map do
  Thread.new do
    1000.times do
      shared_ary << nil
    end
  end
end.each(&:join)

puts shared_ary.size

puts "concurrent with mutex"

shared_ary = Array.new
mutex = Mutex.new

10.times.map do
  Thread.new do
    1000.times do
      mutex.lock
      shared_ary << nil
      mutex.unlock
    end
  end
end.each(&:join)
puts shared_ary.size
