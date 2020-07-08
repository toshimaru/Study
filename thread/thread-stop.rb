thread = Thread.new do
  Thread.stop
  puts "hello world"
end

puts thread.status
nil until thread.status == 'sleep'
puts thread.status

thread.wakeup
thread.join
