favourite = fork do
  exit 77
end

middle_child = fork do
  abort "I want to be waited on!"
end

pid, status = Process.waitpid2(favourite) # same as `rocess.wait2(pid)`
puts status.exitstatus
