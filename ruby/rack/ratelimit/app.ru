# frozen_string_literal: true

# require_relative 'memory_rate_limitter'
require_relative 'redis_rate_limitter'

# Run server with `rackup app.ru`
class App
  def call(env)
    [
      200,
      {},
      ["hello"],
    ]
  end
end

# use MemoryRateLimiter, limit: 10, window: 60
use RedisRateLimiter, limit: 10, window: 60
run App.new
