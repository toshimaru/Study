require 'socket'

UNIXServer.open("/tmp/s") { |serv|
  s = serv.accept
  puts "before send"
  s.send "hello UNIXServer", 0
  s.close
  File.unlink(serv.path)
  puts "after close & unlink"
}
