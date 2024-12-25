# frozen_string_literal: true

class MemoryRateLimiter
  def initialize(app, limit: 60, window: 60)
    @app = app
    @limit = limit
    @window = window
    @requests = {}
  end

  def call(env)
    request = Rack::Request.new(env)
    client_ip = request.ip
    now = Time.now.to_i

    @requests[client_ip] ||= []
    @requests[client_ip].reject! { |timestamp| timestamp < now - @window }

    if @requests[client_ip].size >= @limit
      [429, { 'Content-Type' => 'text/plain' }, ["Rate limit exceeded. Try again later."]]
    else
      @requests[client_ip] << now
      p @requests
      @app.call(env)
    end
  end
end
