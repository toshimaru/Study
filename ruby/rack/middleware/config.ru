require "rack"
require_relative "app"

use Rack::Runtime # Check X-Runtime Header
run App.new
