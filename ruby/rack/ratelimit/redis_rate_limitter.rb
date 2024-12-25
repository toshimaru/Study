# frozen_string_literal: true

require 'redis'

class RedisRateLimiter
  def initialize(app, limit: 60, window: 60)
    @app = app
    @limit = limit
    @window = window
    @redis = Redis.new
  end

  def call(env)
    request = Rack::Request.new(env)
    client_ip = request.ip

    key = "rate_limit:#{client_ip}"
    count = @redis.get(key).to_i

    if count >= @limit
      [429, { 'Content-Type' => 'text/plain' }, ["Rate limit exceeded. Try again later."]]
    else
      @redis.multi do |transaction|
        transaction.incr(key)
        transaction.expire(key, @window) if count == 0
      end
      @app.call(env)
    end
  end
end
