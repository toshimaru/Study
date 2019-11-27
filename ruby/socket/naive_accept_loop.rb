require "socket"

server = Socket.new(:INET, :STREAM)
addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
server.bind(addr)
server.listen(128)

# netstat -ant | grep LISTEN
# => `*.4481(LISTEN)` will appear

loop do
  connection, _ = server.accept
  connection.close
end
