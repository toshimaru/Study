require 'socket'

server = TCPServer.new(4481)

Socket.accept_loop(server) do |connection|
  # handle connection here
  connectin.close
end
