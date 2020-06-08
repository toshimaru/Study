child_processes = 3
dead_processes = 0

child_processes.times do
  fork do
    puts "child_processes"
    sleep 5
  end
end

trap(:CHLD) do
  puts "child_processes trap"
  puts Process.wait
  dead_processes += 1
  exit if dead_processes == child_processes
end

loop do
  puts "loop"
  sleep 1
end
