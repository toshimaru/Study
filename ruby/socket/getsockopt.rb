require "socket"

socket = TCPSocket.new('google.com', 80)
opt = socket.getsockopt(Socket::SOL_SOCKET, Socket::SO_TYPE)
p opt
p opt.int == Socket::SOCK_STREAM
p opt.int == Socket::SOCK_DGRAM

### Wrapper Code Version

socket = TCPSocket.new('google.com', 80)
opt = socket.getsockopt(:SOCKET, :TYPE)
p opt
p opt.int == Socket::SOCK_STREAM
p opt.int == Socket::SOCK_DGRAM
