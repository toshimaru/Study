require 'socket'

socket = Socket.new(:INET, :STREAM)
remote_addr = Socket.pack_sockaddr_in(80, 'google.com')
# remote_addr = Socket.pack_sockaddr_in(70, 'google.com')
#=> Operation timed out - connect(2) for x.x.x.x (Errno::ETIMEDOUT)
socket.connect(remote_addr)
