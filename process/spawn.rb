puts 'Do it the blocking way'
system 'sleep 5'

puts 'Do it the non-blocking way'
Process.spawn 'sleep 5'

puts 'Do it the blocking way'
pid = Process.spawn 'sleep 5'
Process.waitpid(pid)
