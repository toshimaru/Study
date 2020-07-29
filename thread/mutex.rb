mutex = Mutex.new
results = []

Thread.new do
  mutex.synchronize do
    puts '1 begin'
    results << 1
    puts '1 end'
  end
end

Thread.new do
  mutex.synchronize do
    puts '2 begin'
    results << 2
    puts '2 end'
  end
end

mutex.synchronize do
  puts '3 begin'
  results << 3
  puts '3 end'
end

sleep 2

p results
