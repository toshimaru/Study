require "socket"

server = TCPServer.new('localhost', 4481)
server.setsockopt(:SOCKET, :REUSEADDR, true)

puts server.getsockopt(:SOCKET, :REUSEADDR) # => #<Socket::Option: ...
