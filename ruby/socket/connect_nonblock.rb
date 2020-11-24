require 'socket'

socket = Socket.new(:INET, :STREAM)
remote_addr = Socket.pack_sockaddr_in(80, 'google.com')

begin
  socket.connect_nonblock(remote_addr)
rescue Errno::EINPROGRESS
rescue Errno::EALREADY
rescue Errno::ECONNREFUSED
end
