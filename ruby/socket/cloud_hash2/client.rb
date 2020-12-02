require 'socket'

module CloudHash
  class Client
    attr_accessor :host, :port

    def initialize(host, port)
      @connection = TCPSocket.new(host, port)
    end

    def get(key)
      request "GET #{key}"
    end

    def set(key, value)
      request "SET #{key} #{value}"
    end

    def request(string)
      @connection.puts(string)
      @connection.gets
    end
  end
end

client = CloudHash::Client.new "localhost", 4481

puts client.set "prez", "obama"
puts "prez = "
puts client.get "prez"

puts "vp = "
puts client.get "vp"
