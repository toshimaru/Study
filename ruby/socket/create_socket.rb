require "socket"

p Socket::AF_INET
p Socket::SOCK_STREAM
# socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM)

p :INET6
p :STREAM
socket = Socket.new(:INET6, :STREAM)
p socket
