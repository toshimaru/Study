require 'socket'

UNIXServer.open("/tmp/sock") { |serv|
  UNIXSocket.open("/tmp/sock") { |c|
    s = serv.accept
    s.write "ping"
    s.close
    p c.read
  }
}
