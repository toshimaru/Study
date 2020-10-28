require 'socket'

c = UNIXSocket.open("/tmp/s")
p c.recv(100)
