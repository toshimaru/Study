child_processes = 3
dead_processes = 0

child_processes.times do
  fork do
    puts "child_processes"
    sleep 5
  end
end

$stdout.sync = true

trap(:CHLD) do
  puts "child_processes trap"
  begin
    while pid = Process.wait(-1, Process::WNOHANG)
      puts pid
      dead_processes += 1
    end
  rescue Errno::ECHILD
  end
end

loop do
  exit if dead_processes == child_processes

  puts "loop"
  sleep 1
end
