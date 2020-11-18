require "socket"

server = TCPServer.new('localhost', 4481)
server.setsockopt(:SOCKET, :REUSEADDR, true)

p server.getsockopt(:SOCKET, :REUSEADDR) # => #<Socket::Option: ...
p server.getsockopt(:SOCKET, :REUSEADDR).bool # => true
# server.accept
