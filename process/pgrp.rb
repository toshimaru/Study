# process group
puts Process.pid
puts Process.getpgrp
puts Process.getsid

fork do
  puts Process.pid
  puts Process.getpgrp
  puts Process.getsid
end
