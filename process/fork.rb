puts "parent process pid is #{Process.pid}"

if fork
  puts "entered if block from #{Process.pid}, parent pid: #{Process.ppid}"
else
  puts "entered else block from #{Process.pid}, parent pid: #{Process.ppid}"
end
