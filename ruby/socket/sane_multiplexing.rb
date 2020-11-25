connections = [<TCPSocket>, <TCPSocket>, <TCPSocket>]

loop do
  # ask select(2) which connections are ready for reading
  ready = IO.select(connections)

  # read data only from the available connections
  readable_connections = ready[0]
  readable_connections.each do |conn|
     data = conn.readpartial(4096)
     process(data)
  end
end
