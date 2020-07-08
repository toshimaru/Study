thread = Thread.new { sleep 3 }
thread.join

puts "you'll have to wait 3 seconds to see this"
