require 'socket'

server = Socket.new(:INET, :STREAM)
addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
server.bind(addr)
server.listen(128)

connection, _ = server.accept

puts 'Connection Class:'
p connection.class

puts 'Server fileno:'
p server.fileno

puts 'Connection fileno:'
p connection.fileno

puts 'Local address:'
p connection.local_address

puts 'Remote address:'
p connection.remote_address
