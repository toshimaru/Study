# 並行
threads1 = Array.new(3) do
  Thread.new do
    r = rand(10) # Concurrent(since GIL)
    puts "sleep #{r} seconds"
    sleep r
    puts "sleep #{r} seconds ended"
  end
end

puts threads1.each(&:value)

########

# 並列
require 'open-uri'

threads2 = Array.new(3) do
  Thread.new do
    puts open('https://toshimaru.net') # Parallel(since I/O)
  end
end

puts threads2.each(&:value)
