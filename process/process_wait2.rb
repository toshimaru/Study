puts "1"
5.times do
  puts "first loop"
  fork do
    if rand(5).even?
      exit 111
    else
      exit 112
    end
  end
end

puts "2"

5.times do
  puts "second loop"
  pid, status = Process.wait2

  if status.exitstatus == 111
    puts "#{pid} encountered an even number!"
  else
    puts "#{pid} encountered an odd number!"
  end
end

puts "3"
