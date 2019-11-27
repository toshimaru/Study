# # Server Lifecycle
# 1. create
# 2. bind
# 3. listen
# 4. accept
# 5. close

require 'socket'

socket = Socket.new(:INET, :STREAM)

addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
socket.bind(addr)
