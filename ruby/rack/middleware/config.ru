require "rack"
require_relative "app"
require_relative "simple_middleware"

use Rack::Runtime # Check X-Runtime Header
use SimpleMiddleware
run App.new
