# frozen_string_literal: true

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'eventmachine'
end

class EchoServer < EM::Connection
  def receive_data(data)
    puts "Received: #{data}"
    send_data("Echo: #{data}")
  end

  def unbind
    puts "Client disconnected"
  end
end

EM.run do
  EM.start_server 'localhost', 12345, EchoServer
  puts "EventMachine server running on localhost:12345"
end

# ```
# ❯ nc localhost 12345
# hi
# Echo: hi
# ping
# Echo: ping
# ```
